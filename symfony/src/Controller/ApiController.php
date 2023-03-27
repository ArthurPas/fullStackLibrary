<?php

namespace App\Controller;

use App\Entity\Book;
use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Serializer\SerializerInterface;

#[Route('/api')]
class ApiController extends AbstractController
{
    #[Route('/', name: 'app_api_books')]
    public function index(EntityManagerInterface $em): Response
    {
        $books = $em->getRepository(Book::class)->findAll();
        return $this->json($books);
    }
    #[Route('/login', name: 'app_api_login', methods: "POST")]
    public function login(EntityManagerInterface $em,Request $request, UserRepository $ur, SerializerInterface $serializer): Response
    {
        $credentials = $serializer->deserialize($request->getContent(), User::class, 'json');
        $ExepectedUser = $ur->findOneByEmail($credentials->getEmail());
        if ($ExepectedUser == null) {
            return $this->json([
                'message' => 'error',
             ], Response::HTTP_UNAUTHORIZED);
        }
        if ($ExepectedUser->getPassword() == $credentials->getPassword()) {
            $token =rtrim(strtr(base64_encode(random_bytes(32)), '+/', '-'), '=');
            $ExepectedUser->setToken($token);
            $em->persist($ExepectedUser);
            return $this->json(['message' => 'ok']);
        } else {
            return $this->json([
                'message' => 'error',
            ], Response::HTTP_UNAUTHORIZED);
        }
    }
}
