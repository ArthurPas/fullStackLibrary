<?php

namespace App\Controller;

use App\Entity\Author;
use App\Entity\Book;
use App\Entity\User;
use App\Entity\Borrow;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use App\Repository\BookRepository;
use App\Repository\BorrowRepository;
use FOS\RestBundle\Controller\Annotations\View as AnnotationsView;
use Symfony\Component\Serializer\SerializerInterface;
use App\Repository\AuthorRepository;

#[Route('/api')]
class ApiController extends AbstractController
{
    #[AnnotationsView(serializerGroups: ['livre'])]
    #[Route('/books', name: 'app_api')]
    public function index(
        EntityManagerInterface $em,
        Request $request,
        BookRepository $book
    ) {
        $author = $request->query->get('author');
        $nbLastBooks = $request->query->get('nbLastBooks');
        $type = $request->query->get('type');
        if ($author != null && $nbLastBooks == null) {
            $books = $book->findByAuthor($author);
        }
        if ($author == null && $nbLastBooks != null) {
            $books = $book->findByNb($nbLastBooks, $type);
        } else {
            $books = $em->getRepository(Book::class)->findAll();
        }
        return $books;
    }

    #[AnnotationsView(serializerGroups: ['livre'])]
    #[Route('/books/user/{utilisateur}', name: 'app_api_utilisateur')]
    public function getBookByUser(BookRepository $book, string $utilisateur)
    {
        $books = $book->findByUser($utilisateur);
        return $books;
    }
    #[AnnotationsView()]
    #[Route('/books/author/{id}', name: 'app_api_author')]
    public function getAuthorById(AuthorRepository $a, int $id)
    {
        $author = $a->findAuthorById($id);
        return $author;
    }

    #[AnnotationsView(serializerGroups: ['emprunt'])]
    #[Route('/borrow/user/{utilisateur}', name: 'app_api_borrow_user')]
    public function getBorrowByUser(BorrowRepository $borrow, string $utilisateur)
    {
        dump($utilisateur);
        $borrows = $borrow->findBorrowByUser($utilisateur);
        dump($borrows);
        return $borrows;
    }

    #[AnnotationsView(serializerGroups: ['emprunt'])]
    #[Route('/borrow/date/{id}', name: 'app_api_borrow_date')]
    public function getDateOfBorrow(BorrowRepository $borrow, int $id)
    {
        $borrows = $borrow->findDateOfBorrow($id);
        return $borrows;
    }


    #[Route('/login', name: 'app_api_login', methods: "POST")]
    public function login(
        EntityManagerInterface $em,
        Request $request,
        UserRepository $ur,
        SerializerInterface $serializer
    ): Response {
        $credentials = $serializer->deserialize($request->getContent(), User::class, 'json');
        $ExpectedUser = $ur->findOneByEmail($credentials->getEmail());
        if ($ExpectedUser == null) {
            return $this->json([
                'message' => 'error',
            ], Response::HTTP_UNAUTHORIZED);
        }
        if ($ExpectedUser->getPassword() == $credentials->getPassword()) {
            $token = rtrim(strtr(base64_encode(random_bytes(32)), '+/', '-'), '=');
            $ExpectedUser->setToken($token);
            $ur->save($ExpectedUser, true);

            return $this->json([
                'accessToken' => $token,
                'user' => $ExpectedUser,
                'message' => 'success',
            ], Response::HTTP_OK);
        } else {
            return $this->json([
                'message' => 'error',
            ], Response::HTTP_UNAUTHORIZED);
        }
    }

    #[Route('/logout', name: 'app_api_logout', methods: "POST")]
    public function logout(
        EntityManagerInterface $em,
        Request $request,
        UserRepository $ur
    ): Response {
        $userToken = json_decode($request->getContent(), true);
        $ExpectedUser = $ur->findOneByToken($userToken['token']);
        if ($ExpectedUser == null) {
            return $this->json([
                'message' => 'error',
            ], Response::HTTP_UNAUTHORIZED);
        }
        $ExpectedUser->setToken(null);
        $em->persist($ExpectedUser);
        return $this->json([
            'message' => 'success',
        ], Response::HTTP_OK);
    }
}
