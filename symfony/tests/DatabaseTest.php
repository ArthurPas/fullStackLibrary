<?php

namespace App\Tests;

use Doctrine\DBAL\Exception\UniqueConstraintViolationException;
use App\Entity\User;
use App\Entity\Book;
use App\Entity\Borrow;
use App\Repository\UserRepository;
use App\Repository\BookRepository;
use App\Repository\AuthorRepository;
use App\Repository\BorrowRepository;
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

    public function testDateOfBorrow(): void
    {
        self::bootKernel();
        $bor = static::getContainer()->get(BorrowRepository::class);
        $ur = static::getContainer()->get(UserRepository::class);
        $br = static::getContainer()->get(BookRepository::class);
        $borrow = new Borrow();
        
        $borrow
            ->setStartDate(new \DateTime('2021-02-01'))
            ->setEndDate(new \DateTime('2021-01-01'))
            ->setIdUser($ur->findOneByEmail("Evan@gmail.com"))
            ->setIdBook($br->findOneById(1))
        ;
        $this->expectException(\Exception::class);
        $bor->save($borrow, true);
    }
    public function testRatingWithoutBorrow(): void
    {
        self::bootKernel();
        $ur = static::getContainer()->get(UserRepository::class);
        $br = static::getContainer()->get(BookRepository::class);
        //rating a book which is not have been borrowed
        $usr = $ur->findOneByEmail("Doug@gmail.com");
        $this->expectException(\Exception::class);
        $usr->addIdBook($br->findOneById(3));
        $ur->save($usr, true);
    }
    
    public function testValidRating(): void
    {
        self::bootKernel();
        $ur = static::getContainer()->get(UserRepository::class);
        $br = static::getContainer()->get(BookRepository::class);
        $bor = static::getContainer()->get(BorrowRepository::class);
        //rating a book which is not have been borrowed
        $usr = $ur->findOneByEmail("Doug@gmail.com");
        $borrow = new Borrow();
        $borrow
            ->setStartDate(new \DateTime('2021-01-01'))
            ->setEndDate(new \DateTime('2021-02-01'))
            ->setIdUser($usr)
            ->setIdBook($br->findOneById(1))
        ;
        $bor->save($borrow, true);
        $usr->addIdBook($br->findOneById(1));
        $ur->save($usr, true);
        $this->assertTrue($usr->getIdBook()->contains($br->findOneById(1)));
    }
}
