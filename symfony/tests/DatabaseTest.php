<?php

namespace App\Tests;

use PHPUnit\Framework\TestCase;

class DatabaseTest extends TestCase
{
    public function testSomething(): void
    {
        $this->assertTrue(true);
    }

    public function testEmailAlreadyExist(UserRepository $ur): void
    {
        self::bootKernel();

        // Get the Entity Manager
        $entityManager = self::$container->get('doctrine')->getManager();

        // Create a new User entity
        $user = new TestUser();
        $user->setFirstname('Shirley');
        $user->setLastname('Burke');
        $user->setEmail('Shirley@gmail.com');

        // Persist the User entity to the database
        $entityManager->persist($user);
        $entityManager->flush();

        // Assert that the User entity was saved to the database
        $this->assertNotNull($user->getId());
    }
}
