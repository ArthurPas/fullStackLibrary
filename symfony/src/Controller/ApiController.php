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
use App\Repository\BookRepository;
use FOS\RestBundle\Controller\Annotations\View as AnnotationsView;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;
use App\Services\AddressAPIService;
use OpenApi\Attributes as OA;
use Nelmio\ApiDocBundle;

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
    public function getBookByNb(BookRepository $book, int $nb)
    {
        $books = $book->findByNb($nb);
        return $books;
    }

    #[View()]
    #[OA\Parameter(
        name: "email",
        in: "query",
        description: "email of the user",
        required: true,
        schema: new OA\Schema(ref: "#/components/schemas/LoginEmail")
    )]
    #[OA\Parameter(
        name: "password",
        in: "query",
        description: "password of the user",
        required: true,
        schema: new OA\Schema(ref: "#/components/schemas/LoginPassword")
    )]
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
    public function infoUser(int $id, UserRepository $userRepository): Response
    {
        $users = $userRepository->infoUser($id);
        return $this->json($users);
    }
}
