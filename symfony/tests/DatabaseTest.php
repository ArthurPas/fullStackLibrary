<?php

namespace App\Tests;

use Doctrine\DBAL\Exception\UniqueConstraintViolationException;
use App\Entity\User;
use App\Repository\UserRepository;
use App\Repository\BookRepository;
use App\Repository\LanguageRepository;
use App\Repository\AuthorRepository;
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

        $this->assertNotEmpty($user->getIdUser());

        $user2
            ->setFirstname('Shirley')
            ->setLastname('Burke')
            ->setEmail('Shirley@gmail.com')
            ->setPassword('test')
            ->setAvatar('?')
        ;

        $this->expectException(UniqueConstraintViolationException::class);
        $this->expectExceptionCode(1062);
        $tu->save($user2, true);
        
        // $this->assertEquals(null, $tu->getIdUs());
    }

    public function testNumberOfUsers(): void
    {
        self::bootKernel();
        $tu = static::getContainer()->get(UserRepository::class);

        $users = $tu->findAll();
        $this->assertGreaterThan(100, count($users));
    }

    public function testNumberOfBooks(): void
    {
        self::bootKernel();
        $tu = static::getContainer()->get(BookRepository::class);

        $books = $tu->findAll();
        $this->assertGreaterThan(200, $books);
    }

    public function testNumberOfAuthors(): void
    {
        self::bootKernel();
        $tu = static::getContainer()->get(AuthorRepository::class);

        $authors = $tu->findAll();
        $this->assertGreaterThan(50, $authors);
    }

    /*public function testAuthorsWithoutBooks(): void
    {
        self::bootKernel();
        $tu = static::getContainer()->get(AuthorRepository::class);

        $authors = $tu->findSomeWithoutBook();
        $this->assertGreaterThan(0, $authors);
    }*/
}
