<?php
declare(strict_types=1);

class Fixtures
{
    /**
     * @var PDO $connection
     */
    private static $connection;

    /**
     * @return void
     */
    public function generate(): void
    {
        $connection = $this->getConnection();
        try {
            $connection->beginTransaction();
            $this->cleanup();
            $connection->commit();
            $connection->beginTransaction();
            $this->generateEmployes(80);
            $this->generateTransport(50);
            $this->generateSalary(100000);
            $this->generateIncome(1000000);
            $connection->commit();
        } catch (Exception $e) {
            $connection->rollBack();
            echo $e->getMessage();
        }
    }

    private function getRandomName(): string
    {
        static $randomNames = ['Norbert', 'Damon', 'Laverna', 'Annice', 'Brandie', 'Emogene', 'Cinthia', 'Magaret', 'Daria', 'Ellyn', 'Rhoda', 'Debbra', 'Reid', 'Desire', 'Sueann', 'Shemeka', 'Julian', 'Winona', 'Billie', 'Michaela', 'Loren', 'Zoraida', 'Jacalyn', 'Lovella', 'Bernice', 'Kassie', 'Natalya', 'Whitley', 'Katelin', 'Danica', 'Willow', 'Noah', 'Tamera', 'Veronique', 'Cathrine', 'Jolynn', 'Meridith', 'Moira', 'Vince', 'Fransisca', 'Irvin', 'Catina', 'Jackelyn', 'Laurine', 'Freida', 'Torri', 'Terese', 'Dorothea', 'Landon', 'Emelia'];
        return $randomNames[array_rand($randomNames)];
    }

    /**
     * @return PDO
     */
    public function getConnection(): PDO
    {
        if (null === self::$connection) {
            self::$connection = new PDO('mysql:host=127.0.0.1:3357;dbname=CherkasyElektroTrans_Bogdank', 'Bogdank', 'Bogdank', []);
            self::$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
        return self::$connection;
    }

    private function cleanup(): void
    {
        $connection = $this->getConnection();
        $connection->exec('DELETE FROM employe WHERE employe_id > 11');
        $connection->exec('ALTER TABLE employe AUTO_INCREMENT = 12');
        $connection->exec('DELETE FROM transport WHERE transport_id > 16');
        $connection->exec('ALTER TABLE transport AUTO_INCREMENT = 17');
        $connection->exec('DELETE FROM salary WHERE salary_id > 34');
        $connection->exec('ALTER TABLE salary AUTO_INCREMENT = 35');
        $connection->exec('DELETE FROM employe_transport WHERE employe_transport_id > 35');
        $connection->exec('ALTER TABLE employe_transport AUTO_INCREMENT = 36');

    }

    /**
     * @param int $employesCount
     * @throws Exception
     */
    public function generateEmployes(int $employesCount): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();
        // === CREATE Employes ===
        $start = microtime(true);
        $positionId = $employeName = $employeLastName = $positionStartDay = $dob = '';
        $minAgeTimestamp = $currentTimestamp - (31556952 * 45);
        $maxAgeTimestamp = $currentTimestamp - (31556952 * 18);
        $minWorkTimestamp = $currentTimestamp - (31556952 * 27);
        $maxWorkTimestamp = $currentTimestamp - (31556952 * 1);
        $statement = $connection->prepare(<<<SQL
    INSERT INTO employe (position_id, employe_name, employe_last_name, position_start_date, dob)
    VALUES (:positionId, :employeName, :employeLastName, :positionStartDay, :dob)
    ON DUPLICATE KEY UPDATE dob=VALUES(dob), position_id=VALUES(position_id);
SQL
        );
        $statement->bindParam(':positionId', $positionId);
        $statement->bindParam(':employeName', $employeName);
        $statement->bindParam(':employeLastName', $employeLastName);
        $statement->bindParam(':positionStartDay', $positionStartDay);
        $statement->bindParam(':dob', $dob);
        for ($employeId = 11; $employeId < $employesCount; $employeId++) {
            $positionId = random_int(1, 5);
            $employeName = $this->getRandomName();
            $employeLastName = $this->getRandomName();
            $positionTimestamp = random_int($minWorkTimestamp, $maxWorkTimestamp);
            $positionStartDay = date('Y-m-d', $positionTimestamp);
            $timestamp = random_int($minAgeTimestamp, $maxAgeTimestamp);
            $dob = date('Y-m-d', $timestamp);
            $statement->execute();
        }
        echo 'Create employes: ' . (microtime(true) - $start) . "\n";
    }


    public function generateTransport(int $transportCount): void
    {
        $connection = $this->getConnection();
        //=== Create Transport ===
        $start = microtime(true);
        $routeId = $transportNumber = '';
        $statement = $connection->prepare(<<<SQL
    INSERT INTO transport (route_id, transport_number)
    VALUES (:routeId, :transportNumber) ON DUPLICATE KEY UPDATE transport_number=VALUES (transport_number)
SQL
        );
        $statement->bindParam(':routeId', $routeId, PDO::PARAM_INT);
        $statement->bindParam(':transportNumber', $transportNumber, PDO::PARAM_INT);
        for ($transportId = 16; $transportId < $transportCount; $transportId++) {
            $routeId = random_int(1, 6);
            $transportNumber = random_int(1000, 9999);
            $statement->execute();
        }

        echo 'Create transport: ' . (microtime(true) - $start) . "\n";

    }

    public
    function generateSalary(int $salaryCount): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();
        // === CREATE Salarys ===
        $start = microtime(true);
        $employeId = $salaryDate = $salaryValue = '';
        $statement = $connection->prepare(<<<SQL
    INSERT INTO salary (employe_id, salary_date, salary_value)
    VALUES (:employeId, :salaryDate, :salaryValue)
    ON DUPLICATE KEY UPDATE employe_id=VALUES(employe_id), salary_date=VALUES(salary_date);
SQL
        );
        $statement->bindParam(':employeId', $employeId, PDO::PARAM_INT);
        $statement->bindParam(':salaryDate', $salaryDate);
        $statement->bindParam(':salaryValue', $salaryValue, PDO::PARAM_INT);
        for ($salaryId = 34; $salaryId < $salaryCount; $salaryId++) {
            $employeId = random_int(1, 80);
            $timestampSalary = random_int($currentTimestamp - (31556952 * 10), $currentTimestamp);
            $salaryDate = date('Y-m-d', $timestampSalary);
            $salaryValue = random_int(250, 8000);
            $statement->execute();
        }


        echo 'Create salaries: ' . (microtime(true) - $start) . "\n";
    }

    public
    function generateIncome(int $incomeCount): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();
        // === CREATE INCOME ===
        $start = microtime(true);
        $employeId = $transportId = $incomeValue = $incomeDate = '';
        $statement = $connection->prepare(<<<SQL
    INSERT INTO employe_transport (employe_id, transport_id, income, date)
    VALUES (:employeId, :transportId, :incomeValue, :incomeDate)
    ON DUPLICATE KEY UPDATE employe_id=VALUES(employe_id), date=VALUES(date);
SQL
        );
        $statement->bindParam(':employeId', $employeId, PDO::PARAM_INT);
        $statement->bindParam(':transportId', $transportId, PDO::PARAM_INT);
        $statement->bindParam(':incomeValue', $incomeValue, PDO::PARAM_INT);
        $statement->bindParam(':incomeDate', $incomeDate);
        for ($incomeId = 35; $incomeId < $incomeCount; $incomeId++) {
            $employeId = random_int(1, 80);
            $transportId = random_int(1, 50);
            $timestampIncome = random_int($currentTimestamp - (31556952 * 10), $currentTimestamp);
            $incomeDate = date('Y-m-d', $timestampIncome);
            $incomeValue = random_int(250, 8000);
            $statement->execute();
        }
        echo 'Create income: ' . (microtime(true) - $start) . "\n";
    }
}


$fixturesGenerator = new Fixtures();
$fixturesGenerator->generate();