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
use Symfony\Component\Validator\Constraints\DateTime;

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
        $title = $request->query->get('title');
        if ($author != null && $nbLastBooks == null) {
            $books = $book->findByAuthor($author);
        } elseif ($nbLastBooks != null && $author == null && $title == null) {
            $books = $book->findByNb($nbLastBooks, $type);
        } elseif ($title != null && $author == null && $nbLastBooks == null) {
            $books = $book->findByTitle($title);
        } else {
            $books = $em->getRepository(Book::class)->findAll();
        }
        return $books;
    }
    #[AnnotationsView()]
    #[Route('/books/author/{id}', name: 'app_api_author')]
    public function getAuthorById(AuthorRepository $a, int $id)
    {
        $author = $a->findAuthorById($id);
        return $author;
    }
    #[AnnotationsView(serializerGroups: ['nomAuteur'])]
    #[Route('/autocompletion', name: 'app_autocompletion')]
    public function autocompletion(AuthorRepository $a, Request $request)
    {
        $debut = $request->query->get('debut');
        if (strlen($debut) >= 4) {
            $author = $a->autocompleter($debut);
            return $author;
        }
        return null;
    }
    #[AnnotationsView(serializerGroups: ['emprunt'])]
    #[Route('/borrow/user/{utilisateur}', name: 'app_api_borrow_user')]
    public function getBorrowByUser(BorrowRepository $borrow, string $utilisateur)
    {
        $borrows = $borrow->findBorrowByUser($utilisateur);
        return $borrows;
    }

    #[AnnotationsView(serializerGroups: ['emprunt'])]
    #[Route('/borrow/date/{id}', name: 'app_api_borrow_date')]
    public function getDateOfBorrow(BorrowRepository $borrow, int $id)
    {
        $borrows = $borrow->findDateOfBorrow($id);
        return $borrows;
    }

    #[AnnotationsView(serializerGroups: ['emprunt'])]
    #[Route('/borrow/emprunter', name: 'app_api_borrow_emprunt')]
    public function emprunter(
        EntityManagerInterface $em,
        Request $request,
        BorrowRepository $borrow,
        BookRepository $book,
        UserRepository $user
    ) {
        $idBook = $request->query->get('idBook');
        $idBook = $book->findById($idBook);
        $idUser = $request->query->get('idUser');
        $idUser = $user->findById($idUser);

        $date = new \DateTime();
        $borrow = new Borrow();
        $borrow->setStartDate($date);
        $borrow->setIdUser($idUser);
        $borrow->setIdBook($idBook);
        $em->persist($borrow);
        $em->flush();
        return $borrow;
    }

    #[AnnotationsView(serializerGroups: ['emprunt'])]
    #[Route('/borrow/rendre', name: 'app_api_borrow_rendre')]
    public function rendre(
        EntityManagerInterface $em,
        Request $request,
        BorrowRepository $borrow,
    ) {
        $idBorrow = $request->query->get('idBorrow');
        $idBorrow = $borrow->findById($idBorrow);
        $date = new \DateTime();
        $idBorrow->setEndDate($date);
        $em->persist($idBorrow);
        $em->flush();
        return $idBorrow;
    }


    #[Route('/login', name: 'app_api_login', methods: "POST")]
    public function login(
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
