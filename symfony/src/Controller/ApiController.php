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
    #[Route('/books', name: 'app_api')]
    public function index(EntityManagerInterface $em): Response
    {
        $books = $em->getRepository(Book::class)->findAll();
        return $this->json($books);
    }

    #[View()]
    #[Route('/books/{nb}', name: 'app_api_nb')]
    public function getBookByNb(EntityManagerInterface $em, int $nb): Response
    {
        $books = $em->getRepository(Book::class)->bookByNb($nb);
        return $this->json($books);
    }

    #[View()]
    #[Route('/books/auteur/{auteur}', name: 'app_api_books_author')]
    public function getBookByAuthor(EntityManagerInterface $em, int $auteur): Response
    {
        $books = $em->getRepository(Book::class)->bookByAuthor($auteur);
        return $this->json($books);
    }

}
