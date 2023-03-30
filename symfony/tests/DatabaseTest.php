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
    public function testConstraintDateOfBorrow(): void
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

    /**
     * Test la connexion et la déconnexion d'un utilisateur
     */
    public function testLoginAndLogout(): void
    {
        $client = static::createClient();

        $ur = static::getContainer()->get(UserRepository::class);
        $user = $ur->findOneByEmail("Evan@gmail.com");

        $client->jsonRequest('POST', '/api/login', [
            'email' => $user->getEmail(),
            'password' => $user->getPassword(),
        ]);

        $this->assertResponseStatusCodeSame(200);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertEquals($user->getToken(), $data['accessToken']);

        $client->jsonRequest('POST', '/api/logout', [
            'email' => $user->getEmail(),
            'password' => $user->getPassword(),
            'token' => $user->getToken(),
        ]);

        $this->assertResponseStatusCodeSame(200);
        $this->assertEquals(null, $ur->findOneByToken($user->getToken()));
    }


    /**
     * Test la route /api/books
     */
    public function testBooks(): void
    {
        $client = static::createClient();
        $br = static::getContainer()->get(BookRepository::class);
        //nbResults & type
        $nbRes = 10;
        $type = "ASC";
        $client->jsonRequest('GET', '/api/books?nbResults=' . $nbRes . '&type=' . $type);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertEquals(count($br->findByNb($nbRes, $type)), count($data));
        $this->assertResponseStatusCodeSame(200);
        // title
        $title = "It";
        $client->jsonRequest('GET', '/api/books?title=' . $title);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertEquals(count($br->findByTitle($title)), count($data));
        $this->assertResponseStatusCodeSame(200);
        // author
        $author = "Voltaire";
        $client->jsonRequest('GET', '/api/books?author=' . $author);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertResponseStatusCodeSame(200);
        $this->assertEquals(count($br->findByAuthor($author)), count($data));
    }

    public function testAuthorById()
    {
        $client = static::createClient();
        $ar = static::getContainer()->get(AuthorRepository::class);
        //known author
        $authorId = 4;
        $client->jsonRequest('GET', '/api/author/' . $authorId);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertEquals(count($ar->findAuthorById($authorId)), count($data));
        $this->assertResponseStatusCodeSame(200);
        //unknown author
        $authorId = 3875932759573987;
        $client->jsonRequest('GET', '/api/author/' . $authorId);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertResponseStatusCodeSame(404);
    }

    public function testFollow()
    {
        $client = static::createClient();
        $ur = static::getContainer()->get(UserRepository::class);
        //user who follow someone
        $followId = 5;
        $client->jsonRequest('GET', '/api/follow/' . $followId);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertEquals(count($ur->findUserFollowings($followId)), count($data));
        $this->assertResponseStatusCodeSame(200);
        //user who follow no one
        $followId = 6;
        $client->jsonRequest('GET', '/api/follow/' . $followId);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertResponseStatusCodeSame(404);
    }

    public function testFollowed()
    {
        $client = static::createClient();
        $ur = static::getContainer()->get(UserRepository::class);
        //user who follow someone
        $followId = 6;
        $client->jsonRequest('GET', '/api/followed/' . $followId);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertEquals(count($ur->findByUserIsFollowed($followId)), count($data));
        $this->assertEquals($ur->findByUserIsFollowed($followId)[0]["idUser"], $data[0]['idUser']);
        $this->assertResponseStatusCodeSame(200);
        //user who follow no one
        $followId = 5;
        $client->jsonRequest('GET', '/api/followed/' . $followId);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertResponseStatusCodeSame(404);
    }

    public function testInfoUser()
    {
        $client = static::createClient();
        $ur = static::getContainer()->get(UserRepository::class);

        $UserId = 6;
        $client->jsonRequest('GET', '/api/user/' . $UserId);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertEquals(count($ur->infoUser($UserId)), count($data));
        $this->assertEquals($ur->infoUser($UserId)[0]["idUser"], $data[0]['idUser']);
        $this->assertEquals($ur->infoUser($UserId)[0]["email"], $data[0]['email']);
        $this->assertEquals($ur->infoUser($UserId)[0]["firstname"], $data[0]['firstname']);
        $this->assertEquals($ur->infoUser($UserId)[0]["lastname"], $data[0]['lastname']);
        $this->assertResponseStatusCodeSame(200);
        //
        $UserId = 5160465154;
        $client->jsonRequest('GET', '/api/user/' . $UserId);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertResponseStatusCodeSame(404);
    }

    public function testAutocomplet()
    {
        $client = static::createClient();
        $ar = static::getContainer()->get(AuthorRepository::class);
        //valid autocomplet (length >= 4)
        $startby = "zola";
        $client->jsonRequest('GET', '/api/autocompletion?startby=' . $startby);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertEquals(count($ar->autocompletion($startby)), count($data));
        $this->assertResponseStatusCodeSame(200);
        //invalid autocomplet (length<4)
        $startby = "kin";
        $client->jsonRequest('GET', '/api/autocompletion?startby=' . $startby);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertResponseStatusCodeSame(204);
        $this->assertEquals(null, $data);
        //0 line answered
        $startby = "+=^";
        $client->jsonRequest('GET', '/api/autocompletion?startby=' . $startby);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertResponseStatusCodeSame(204);
    }

    public function testBorrowFromUser()
    {
        //with email
        // user email with borrow
        $client = static::createClient();
        $br = static::getContainer()->get(BorrowRepository::class);
        $emailUser = "Evan@gmail.com";
        $client->jsonRequest('GET', '/api/borrow/user/' . $emailUser);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertEquals(count($br->findBorrowByUser($emailUser)), count($data));
        $this->assertResponseStatusCodeSame(200);
        //user email without borrow
        $emailUser = "Aaron@gmail.com";
        $client->jsonRequest('GET', '/api/borrow/user/' . $emailUser);
        $data = json_decode($client->getResponse()->getContent(), true);
        //$this->assertResponseStatusCodeSame(404);
        //invalid user email
        $invalidEmailUser = "ibebefz@@@.e.€±å@±eå±@gmail.com";
        $client->jsonRequest('GET', '/api/borrow/user/' . $invalidEmailUser);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertResponseStatusCodeSame(404);
        //with id
        //user id with borrow
        $idUser = 2;
        $client->jsonRequest('GET', '/api/borrow/user/' . $idUser);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertEquals(count($br->findBorrowByIdUser($idUser)), count($data));
        $this->assertResponseStatusCodeSame(200);
        //id user without borrow
        $idUser = 495;
        $client->jsonRequest('GET', '/api/borrow/user/' . $idUser);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertResponseStatusCodeSame(404);
        //unknown id user
        $idUser = 49554544578797;
        $client->jsonRequest('GET', '/api/borrow/user/' . $idUser);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertResponseStatusCodeSame(404);
    }

    public function testDateOfBorrow()
    {
        $client = static::createClient();
        $br = static::getContainer()->get(BorrowRepository::class);
        //user id with borrow
        $userId = 4;
        $client->jsonRequest('GET', '/api/borrow/date/' . $userId);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertEquals(count($br->findDateOfBorrow($userId)), count($data));
        $expectedDate = $br->findDateOfBorrow($userId)[0]["startDate"]->format('Y-m-d');
        $this->assertTrue(str_contains($data[0]["startDate"], $expectedDate));
        $this->assertResponseStatusCodeSame(200);
        //user without borrow
        $userId = 495;
        $client->jsonRequest('GET', '/api/borrow/date/' . $userId);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertResponseStatusCodeSame(404);
        //unknown user id
        $userId = 546876456879875;
        $client->jsonRequest('GET', '/api/borrow/date/' . $userId);
        $data = json_decode($client->getResponse()->getContent(), true);
        $this->assertResponseStatusCodeSame(404);
    }
}
