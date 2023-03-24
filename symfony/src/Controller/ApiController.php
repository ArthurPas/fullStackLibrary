<?php

namespace App\Controller;

use App\Entity\Book;
use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\DBAL\Schema\View;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;use App\Repository\BookRepository;
use FOS\RestBundle\Controller\Annotations\View as AnnotationsView;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Serializer\Context\Normalizer\ObjectNormalizerContextBuilder;
use Symfony\Component\HttpFoundation\Request;

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
        if ($author != null) {
            $books = $book->findByAuthor($author);
        } else {
            $books = $em->getRepository(Book::class)->findAll();
        }
        return $books;
    }

    #[AnnotationsView(serializerGroups: ['livre'])]
    #[Route('/books/{nb}', name: 'app_api_nb')]
    public function getBookByNb(BookRepository $book, int $nb): Response
    {
        $books = $book->findByNb($nb);
        return $books;
    }

    #[Route('/login', name: 'app_api_login', methods: "POST")]
    public function login(
        EntityManagerInterface $em,
        Request $request,
        UserRepository $ur,
        SerializerInterface $serializer
    ): Response {
        $credentials = $serializer->deserialize($request->getContent(), User::class, 'json');
        $ExepectedUser = $ur->findOneByEmail($credentials->getEmail());
        if ($ExepectedUser == null) {
        $user = $ur->findOneByEmail($mailRecu);
        if ($user == null) {
            return $this->json([
                'message' => 'error',
             ], Response::HTTP_UNAUTHORIZED);
        }
        if ($ExepectedUser->getPassword() == $credentials->getPassword()) {
            $token = rtrim(strtr(base64_encode(random_bytes(32)), '+/', '-'), '=');
            $ExepectedUser->setToken($token);
            $em->persist($ExepectedUser);
            return $this->json([
                'accessToken' => $token,
                'user' => $ExepectedUser,
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
        UserRepository $ur,
        SerializerInterface $serializer
    ): Response {
        $credentials = $serializer->deserialize($request->getContent(), User::class, 'json');
        $ExepectedUser = $ur->findOneByEmail($credentials->getEmail());
        if ($ExepectedUser == null) {
            return $this->json([
                'message' => 'error',
             ], Response::HTTP_UNAUTHORIZED);
        }
        if ($ExepectedUser->getPassword() == $credentials->getPassword()) {
            $ExepectedUser->setToken(null);
            $em->persist($ExepectedUser);
            return $this->json([
                'message' => 'success',
            ], Response::HTTP_OK);
        } else {
        if ($user->getPassword() == $mdpRecu) {
            return $this->json(['message' => 'ok']);
        }
        else {
            return $this->json([
                'message' => 'error',
            ], Response::HTTP_UNAUTHORIZED);
        }
    }
}
