<?php

namespace App\Controller;

use App\Entity\Book;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\DBAL\Schema\View;
use Doctrine\ORM\EntityManagerInterface;
use App\Repository\BookRepository;
use FOS\RestBundle\Controller\Annotations\View as AnnotationsView;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Serializer\Context\Normalizer\ObjectNormalizerContextBuilder;
use Symfony\Component\HttpFoundation\Request;

#[Route('/api')]
class ApiController extends AbstractController
{
    #[AnnotationsView(serializerGroups: ['livre'])]
    #[Route('/books', name: 'app_api')]
    public function index(EntityManagerInterface $em, SerializerInterface $serializer, Request $request, BookRepository $book)
    {
        $author = $request->query->get('author');
        if ($author != null) {
            $books = $book->findByAuthor($author);
        } else {
            $books = $em->getRepository(Book::class)->findAll();
        }

        return $books;
    }

    #[Route('/books/{nb}', name: 'app_api_nb')]
    public function getBookByNb(BookRepository $book, int $nb, SerializerInterface $serializer): Response
    {
        $books = $book->findByNb($nb);
        $context = (new ObjectNormalizerContextBuilder())
        ->withGroups(['livre'])
        ->toArray();
        $json = $serializer->serialize($books, 'json', $context);
        return $this->json($json);
    }
}
