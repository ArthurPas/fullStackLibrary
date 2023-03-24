<?php

namespace App\Controller;

use App\Entity\Book;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations\View;
use App\Repository\BookRepository;


#[Route('/api')]
class ApiController extends AbstractController
{
    #[View()]
    #[Route('/books', name: 'app_books')]
    public function showBooks(BookRepository $bookRepository)
    {
        $books = $bookRepository->findAll();
        return $this->json($books);
    }
}
