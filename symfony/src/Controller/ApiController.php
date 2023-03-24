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
use Symfony\Component\HttpFoundation\Request;

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
    public function login(Request $request, UserRepository $ur): Response
    {
        $mailRecu = $request->query->get("email");
        $mdpRecu = $request->query->get("password");

        $user = $ur->findOneByEmail($mailRecu);
        if ($user == null) {
            return $this->json([
                'message' => 'error',
             ], Response::HTTP_UNAUTHORIZED);
        }
        if ($user->getPassword() == $mdpRecu) {
            return $this->json(['message' => 'ok']);
        } else {
            return $this->json([
                'message' => 'error',
            ], Response::HTTP_UNAUTHORIZED);
        }
    }
}
