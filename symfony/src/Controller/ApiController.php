<?php

namespace App\Controller;

use App\Entity\Book;
use App\Entity\User;
use App\Repository\BookRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\DBAL\Schema\View;
use Doctrine\ORM\EntityManagerInterface;
use SebastianBergmann\Environment\Console;

#[Route('/api')]
class ApiController extends AbstractController
{
    #[Route('/', name: 'app_api')]
    public function index(BookRepository $books): Response
    {
        $books = $books->ShowAllBooks();
        return $this->json($books);
    }

    #[Route('/followed/{id}', name: 'app_followed_id')]
    public function listfollowedId(int $id, UserRepository $userRepository): Response
    {
        $users = $userRepository->findByUserIsFollowed($id);
        return $this->json($users);
    }

    #[Route('/follow/{id}', name: 'app_follow_id')]
    public function listfollowId(int $id, UserRepository $userRepository): Response
    {
        $users = $userRepository->findUserFollowings($id);
        return $this->json($users);
    }

    #[Route('/infoUser/{id}', name: 'app_Infouser_id')]
    public function InfoUser(int $id, UserRepository $userRepository): Response
    {
        $users = $userRepository->InfoUser($id);
        return $this->json($users);
    }



    // $users = $em->getRepository(User::class)->listFollowedUsers($us);
    // return $this->json($users);
}
