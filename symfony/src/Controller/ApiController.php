<?php

namespace App\Controller;

use App\Entity\Book;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\DBAL\Schema\View;
use Doctrine\ORM\EntityManagerInterface;


#[Route('/api')]
class ApiController extends AbstractController
{
    #[View()]
    #[Route('/', name: 'app_api')]
    public function index(EntityManagerInterface $em): Response
    {
        $books = $em->getRepository(Book::class)->findAll();
        return $this->json($books);
}
}
