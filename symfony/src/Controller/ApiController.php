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
use OpenApi\Attributes\RequestBody;
use OpenApi\Attributes\MediaType;
use OpenApi\Attributes\Schema;
use OpenApi\Attributes\Property;

use function PHPSTORM_META\type;

#[Route('/api')]
class ApiController extends AbstractController
{

    #[View()]
    #[OA\Parameter(
        name: "author",
        in: "query",
        description: "Get the book by author name",
        required: true,
        schema: new OA\Schema(ref: "#/components/schemas/Books")

    )]
    #[OA\Response(
        response: "200",
        description: "Books information retrieved successfully",
    )]
    #[OA\Response(
        response: "404",
        description: "No books found",
    )]
    #[OA\Response(
        response: "500",
        description: "Query syntax error",
    )]
    #[AnnotationsView(serializerGroups: ['livre'])]
    #[Route('/books', name: 'app_api', methods: "GET")]
    public function index(
        EntityManagerInterface $em,
        Request $request,
        BookRepository $book
    ) {
        $author = $request->query->get('author');
        $nbLastBooks = $request->query->get('nbLastBooks');
        $type = $request->query->get('type');
        if ($author != null && $nbLastBooks == null) {
            $books = $book->findByAuthor($author);
        }
        if ($author == null && $nbLastBooks != null) {
            $books = $book->findByNb($nbLastBooks, $type);
        } else {
            $books = $em->getRepository(Book::class)->findAll();
        }
        return $books;
    }


    #[OA\Parameter(
        name: "Firstname",
        in: "path",
        description: "The ID of the user to get the list of the users he follows",
        required: true,
    )]
    #[AnnotationsView(serializerGroups: ['livre'])]
    #[Route('/books/user/{utilisateur}', name: 'app_api_utilisateur', methods: "GET")]
    public function getBookByUser(BookRepository $book, string $utilisateur)
    {
        $books = $book->findByUser($utilisateur);
        return $books;
    }


    #[OA\Parameter(
        name: "id",
        in: "path",
        description: "The ID of the user to get the list of the users he follows",
        required: true,
    )]
    #[OA\Response(
        response: "200",
        description: "All people followed by this user are displayed correctly",
    )]
    #[OA\Response(
        response: "404",
        description: "No users found",
    )]
    #[OA\Response(
        response: "500",
        description: "Query syntax error",
    )]
    #[Route('/follow/{id}', name: 'app_follow_id', methods: "GET")]
    public function listfollowId(int $id, UserRepository $userRepository): Response
    {
        $users = $userRepository->findUserFollowings($id);
        return $this->json($users);
    }



    #[OA\Parameter(
        name: "id",
        in: "path",
        description: "The ID of the user to get the list of the users he follows",
        required: true,
    )]
    #[OA\Response(
        response: "200",
        description: "All people who follow this person are displayed correctly",

    )]
    #[OA\Response(
        response: "404",
        description: "No users found",
    )]
    #[OA\Response(
        response: "500",
        description: "Query syntax error",
    )]
    #[Route('/followed/{id}', name: 'app_followed_id', methods: "GET")]
    public function listfollowedId(int $id, UserRepository $userRepository): Response
    {
        $users = $userRepository->findByUserIsFollowed($id);
        return $this->json($users);
    }

    #[OA\Response(
        response: "200",
        description: "Info of the user are displayed correctly",
    )]
    #[OA\Response(
        response: "404",
        description: "No users found",
    )]
    #[OA\Response(
        response: "500",
        description: "Query syntax error",
    )]
    #[Route('/infoUser/{id}', name: 'app_Infouser_id', methods: "GET")]
    public function infoUser(int $id, UserRepository $userRepository): Response
    {
        $users = $userRepository->infoUser($id);
        return $this->json($users);
    }



    #[OA\RequestBody(
        request: "Login",
        content: new OA\JsonContent(ref: "#/components/schemas/Login")
    )]
    #[OA\Response(
        response: "200",
        description: "The user is logged in successfully",
    )]
    #[OA\Response(
        response: "401",
        description: "No users found",
    )]
    #[OA\Response(
        response: "500",
        description: "Bug jsp pk wlh",
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


    #[OA\RequestBody(
        request: "Logout",
        content: new OA\JsonContent(ref: "#/components/schemas/Logout")
    )]

    #[OA\Response(
        response: "200",
        description: "The user is logged out successfully",
    )]
    #[OA\Response(
        response: "401",
        description: "No token found",
    )]

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
