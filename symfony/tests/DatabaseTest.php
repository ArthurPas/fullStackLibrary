<?php

namespace App\Tests;

use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class DatabaseTest extends WebTestCase
{
    public function testEmailAlreadyExist(): void
    {
        self::bootKernel();
        $tu = static::getContainer()->get(UserRepository::class);

        // Create a new User entity
        $user = new User();
        $user2 = new User();

        $user
            ->setFirstname('Shirley')
            ->setLastname('Burke')
            ->setEmail('Shirley@gmail.com')
            ->setPassword('test')
            ->setAvatar('?')
        ;
        $tu->save($user, true);


        $user2
            ->setFirstname('Shirley')
            ->setLastname('Burke')
            ->setEmail('Shirley@gmail.com')
            ->setPassword('test')
            ->setAvatar('?')
        ;



        $this->assertNotEmpty($user->getIdUser());
        $tu->save($user2, true);
        $this->assertNotEmpty($user2->getIdUser());
        // $this->assertEquals(null, $tu->getIdUs());
    }

}
