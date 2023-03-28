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

    /**
     * Test si le nombre d'utilisateurs est supérieur à 100
     */
    public function testNumberOfUsers(): void
    {
        self::bootKernel();
        $tu = static::getContainer()->get(UserRepository::class);

        $users = $tu->findAll();
        $this->assertGreaterThan(100, count($users));
    }

    /**
     * Test si le nombre de livres est supérieur à 200
     */
    public function testNumberOfBooks(): void
    {
        self::bootKernel();
        $tu = static::getContainer()->get(BookRepository::class);

        $books = $tu->findAll();
        $this->assertGreaterThan(200, count($books));
    }

    /**
     * Test si le nombre d'auteurs est supérieur à 50
     */
    public function testNumberOfAuthors(): void
    {
        self::bootKernel();
        $tu = static::getContainer()->get(AuthorRepository::class);

        $authors = $tu->findAll();
        $this->assertGreaterThan(50, count($authors));
    }

    public function testAuthorsWithoutBooks(): void
    {
        self::bootKernel();
        $tu = static::getContainer()->get(AuthorRepository::class);

        $authors = $tu->findSomeWithoutBook();
        $this->assertGreaterThan(0, count($authors));
    }

    /**
     * Test la contrainte de date de début de prêt
     */
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

    /**
     * Test la contrainte de notation d'un livre
     */
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

    /**
     * Test la validité de la notation d'un livre
     */
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

    /**
     * Test qu'il existe des livres écrits par plusieurs auteurs
     */
    public function testBooksWriteBySeveralAuthors(): void
    {
        self::bootKernel();
        $br = static::getContainer()->get(BookRepository::class);

        $books = $br->findSomeWithSeveralAuthors();
        $this->assertGreaterThan(0, count($books));
    }

    /**
     * Test qu'il existe des livres écrits par un seul auteur
     */
    public function testBooksWriteByOneAuthor(): void
    {
        self::bootKernel();
        $br = static::getContainer()->get(BookRepository::class);

        $books = $br->findSomeWithOneAuthor();
        $this->assertGreaterThan(0, count($books));
    }

    /**
     * Test qu'il existe des auteurs ayant écrit plusieurs livres
     */
    public function testAuthorsWithSeveralBooks(): void
    {
        self::bootKernel();
        $ar = static::getContainer()->get(AuthorRepository::class);

        $authors = $ar->findSomeWithSeveralBooks();
        $this->assertGreaterThan(0, count($authors));
    }

    /**
     * Test qu'il existe des auteurs ayant écrit un seul livre
     */
    public function testAuthorWithOneBook(): void
    {
        self::bootKernel();
        $ar = static::getContainer()->get(AuthorRepository::class);

        $authors = $ar->findSomeWithOneBook();
        $this->assertGreaterThan(0, count($authors));
    }

    /**
     * Test qu'il existe des utilisateurs n'ayant pas encore emprunté de livre
     */
    public function testUsersWithoutBorrow(): void
    {
        self::bootKernel();
        $ur = static::getContainer()->get(UserRepository::class);

        $users = $ur->findSomeWithoutBorrow();
        $this->assertGreaterThan(0, count($users));
    }

    /**
     * Test qu'il existe des livres n'ayant pas encore été rendu
     */
    public function testBorrowNotReturned(): void
    {
        self::bootKernel();
        $bor = static::getContainer()->get(BorrowRepository::class);

        $borrows = $bor->findSomeBorrowNotReturned();
        $this->assertGreaterThan(0, count($borrows));
    }

    /**
     * Test qu'il existe des utilisateurs ayant emprunté plus d'un livre
     */
    public function testUserBorrowMoreThanOneBook(): void
    {
        self::bootKernel();
        $bor = static::getContainer()->get(UserRepository::class);

        $borrows = $bor->findSomeUserBorrowMoreThanOneBook();
        $this->assertGreaterThan(0, count($borrows));
    }

    /**
     * Test qu'il existe des utilisateurs ayant emprunté le même livre plus d'une fois
     */
    public function testUserBorrowSameBookTwice(): void
    {
        self::bootKernel();
        $bor = static::getContainer()->get(UserRepository::class);

        $borrows = $bor->findSomeUserBorrowSameBookTwice();
        $this->assertGreaterThan(0, count($borrows));
    }

    public function testLogin(): void
    {
        self::bootKernel();
        $client = static::createClient();
        $crawler = $client->request('GET', '/login');
    }
}