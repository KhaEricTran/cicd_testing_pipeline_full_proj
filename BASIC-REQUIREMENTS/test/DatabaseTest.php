<?php
require './src/Database.php';
use PHPUnit\Framework\TestCase;

class DatabaseTest extends TestCase
{
    /** @group db */
    public function testMockProductsAreReturned()
    {
        $mockRepo = $this->createMock(Database::class);

        $mockProductsArray = [
            ['id' => 1, 'name' => 'RMIT Merch'],
            ['id' => 2, 'name' => 'RMIT Merch'],
        ];

        $mockRepo->method('resultSet')->willReturn($mockProductsArray);

        $products = $mockRepo->resultSet();


        $this->assertEquals('RMIT Merch', $products[0]['name']);
        $this->assertEquals('RMIT Merch', $products[1]['name']);
    }
}
       
