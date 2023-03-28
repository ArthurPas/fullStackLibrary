<?php

namespace App\Controller;

use App\Entity\Book;
use App\Entity\User;
use App\Entity\Borrow;
use App\Entity\Author;
use App\Repository\BorrowRepository;
use App\Repository\AuthorRepository;
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
use OpenApi\Attributes as OA;
use Symfony\Component\HttpFoundation\JsonResponse;

#[Route('/api')]
class ApiController extends AbstractController
{

    // BOOKS

    #[OA\Tag(name: "Books")]
    #[OA\Parameter(
        name: "author",
        in: "query",
        description: "Get the book by author name",
        required: true,
        schema: new OA\Schema(ref: "#/components/schemas/Books/properties/author")
    )]
    #[OA\Parameter(
        name: "nbLastBooks",
        in: "query",
        description: "Number of books to retrieve",
        required: false,
        schema: new OA\Schema(ref: "#/components/schemas/Books/properties/nbLastBooks")
    )]
    #[OA\Parameter(
        name: "type",
        in: "query",
        description: "Type of books to retrieve",
        required: false,
        schema: new OA\Schema(ref: "#/components/schemas/Books/properties/type")
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
        } else if ($author == null && $nbLastBooks != null) {
            $books = $book->findByNb($nbLastBooks, $type);
        } else {
            $books = $em->getRepository(Book::class)->findAll();
        }
        if (count($books) === 0) {
            return new JsonResponse(['error' => 'No books found'], Response::HTTP_NOT_FOUND);
        }
        return $books;
    }

    #[OA\Tag(name: "Author")]
    #[OA\Tag(name: "Books")]
    #[OA\Parameter(
        name: "id",
        in: "path",
        description: "Get the list of books by author id",
        required: true,
    )]
    #[OA\Response(
        response: "200",
        description: "Books information retrieved successfully",
    )]
    #[OA\Response(
        response: "404",
        description: "No author found",
    )]
    #[OA\Response(
        response: "500",
        description: "Query syntax error",
    )]
    #[AnnotationsView()]
    #[Route('/books/author/{id}', name: 'app_api_author', methods: "GET")]
    public function getAuthorById(AuthorRepository $a, int $id)
    {
        $author = $a->findAuthorById($id);
        if (count($author) === 0) {
            return new JsonResponse(['error' => 'No author found'], Response::HTTP_NOT_FOUND);
        }
        return $author;
    }


        // Follow

    #[OA\Tag(name: "Follow")]
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
        description: "Error on this user",
    )]
    #[OA\Response(
        response: "500",
        description: "Query syntax error",
    )]
    #[Route('/follow/{id}', name: 'app_follow_id', methods: "GET")]
    public function listfollowId(int $id, UserRepository $userRepository): Response
    {
        $exist = $userRepository->find($id);
        if ($exist == null) {
            return new JsonResponse(['error' => 'No users found'], Response::HTTP_NOT_FOUND);
        }
        $users = $userRepository->findUserFollowings($id);
        if (count($users) === 0) {
            return new JsonResponse(['error' => 'This person follow nobody'], Response::HTTP_NOT_FOUND);
        }
        return $this->json($users);
    }

    #[OA\Tag(name: "Follow")]
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
        description: "Error on this user",
    )]
    #[OA\Response(
        response: "500",
        description: "Query syntax error",
    )]
    #[Route('/followed/{id}', name: 'app_followed_id', methods: "GET")]
    public function listfollowedId(int $id, UserRepository $userRepository): Response
    {
        $exist = $userRepository->find($id);
        if ($exist == null) {
            return new JsonResponse(['error' => 'No users found'], Response::HTTP_NOT_FOUND);
        }
        $users = $userRepository->findByUserIsFollowed($id);
        if (count($users) === 0) {
            return new JsonResponse(['error' => 'Nobody follow this person'], Response::HTTP_NOT_FOUND);
        }
        return $this->json($users);
    }


    // USER

    #[OA\Tag(name: "User")]
    #[OA\Parameter(
        name: "id",
        in: "path",
        description: "The ID of a user for which you want to know the information",
        required: true,
    )]
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
    #[Route('/user/{id}', name: 'app_user_id', methods: "GET")]
    public function infoUser(int $id, UserRepository $userRepository): Response
    {
        $users = $userRepository->infoUser($id);
        if (count($users) === 0) {
            return new JsonResponse(['error' => 'No users found'], Response::HTTP_NOT_FOUND);
        }
        return $this->json($users);
    }


    // AUTHOR

    #[OA\Tag(name: "Author")]
    #[OA\Parameter(
        name: "debut",
        in: "query",
        description: "Get the book by author name",
        required: true,
        schema: new OA\Schema(ref: "#/components/schemas/Authors")
    )]
    #[OA\Response(
        response: "200",
        description: "Author information retrieved successfully",
    )]
    #[OA\Response(
        response: "204",
        description: "No author found",
    )]

    #[AnnotationsView(serializerGroups: ['nomAuteur'])]
    #[Route('/autocompletion', name: 'app_autocompletion', methods: "GET")]
    public function autocompletion(AuthorRepository $a, Request $request)
    {
        $debut = $request->query->get('debut');
        if (strlen($debut) >= 4) {
            $author = $a->autocompleter($debut);
            if (count($author) === 0) {
                return new JsonResponse(['error' => 'No author found'], Response::HTTP_NO_CONTENT);
            }
            return $author;
        }
        return null;
    }


    // BORROW

    #[OA\Tag(name: "Borrow")]
    #[OA\Parameter(
        name: "utilisateur",
        in: "path",
        description: "Get the list of books that the user has borrowed by his email",
        required: true,
        example: "Nathan@gmail.com"
    )]
    #[OA\Response(
        response: "200",
        description: "Borrows information retrieved successfully",
    )]
    #[OA\Response(
        response: "404",
        description: "No borrows or users found",
    )]
    #[AnnotationsView(serializerGroups: ['emprunt'])]
    #[Route('/borrow/user/{utilisateur}', name: 'app_api_borrow_user', methods: "GET")]
    public function getBorrowByUser(BorrowRepository $borrow, string $utilisateur)
    {
        $borrows = $borrow->findBorrowByUser($utilisateur);
        if (count($borrows) === 0) {
            return new JsonResponse(['error' => 'No borrows or users found'], Response::HTTP_NOT_FOUND);
        }
        return $borrows;
    }

    #[OA\Tag(name: "Borrow")]
    #[OA\Parameter(
        name: "id",
        in: "path",
        description: "Get the date of the borrow with the borrow ID",
        required: true,
    )]
    #[OA\Response(
        response: "200",
        description: "Borrows information retrieved successfully",
    )]
    #[OA\Response(
        response: "404",
        description: "No borrows found",
    )]
    #[AnnotationsView(serializerGroups: ['emprunt'])]
    #[Route('/borrow/date/{id}', name: 'app_api_borrow_date', methods: "GET")]
    public function getDateOfBorrow(BorrowRepository $borrow, int $id)
    {
        $borrows = $borrow->findDateOfBorrow($id);
        if (count($borrows) === 0) {
            return new JsonResponse(['error' => 'No borrows found'], Response::HTTP_NOT_FOUND);
        }
        return $borrows;
    }


    #[OA\Tag(name: "Borrow")]
    #[OA\Parameter(
        name: "idBook",
        in: "query",
        description: "id of the book to borrow",
        required: true,
        schema: new OA\Schema(ref: "#/components/schemas/Borrows/properties/idBook")
    )]
    #[OA\Parameter(
        name: "idUser",
        in: "query",
        description: "id of the user who wants to borrow the book",
        required: true,
        schema: new OA\Schema(ref: "#/components/schemas/Borrows/properties/idUser")
    )]
    #[OA\Response(
        response: "200",
        description: "Books information retrieved successfully",
    )]
    #[OA\Response(
        response: "404",
        description: "Information not found",
    )]
    #[OA\Response(
        response: "500",
        description: "Query syntax error",
    )]
    #[OA\Tag(name: "Borrow")]
    #[AnnotationsView(serializerGroups: ['emprunt'])]
    #[Route('/borrow/emprunter', name: 'app_api_borrow_emprunter', methods: "GET")]
    public function emprunter(
        EntityManagerInterface $em,
        Request $request,
        BorrowRepository $borrow,
        BookRepository $book,
        UserRepository $user
    ) {
        $idBook = $request->query->get('idBook');
        $idBook = $book->findById($idBook);
        $idUser = $request->query->get('idUser');
        $idUser = $user->findById($idUser);
        if ($idBook === null && $idUser === null) {
            return new JsonResponse(['error' => 'No books and users found'], Response::HTTP_NOT_FOUND);
        }
        else if ($idBook === null) {
            return new JsonResponse(['error' => 'No books found'], Response::HTTP_NOT_FOUND);
        } else if ($idUser === null) {
            return new JsonResponse(['error' => 'No users found'], Response::HTTP_NOT_FOUND);
        }
        $date = new \DateTime();
        $borrow = new Borrow();
        $borrow->setStartDate($date);
        $borrow->setIdUser($idUser);
        $borrow->setIdBook($idBook);
        $em->persist($borrow);
        $em->flush();
        //return $borrow && new JsonResponse(['success' => 'Borrow created'], Response::HTTP_OK);
        return $this->json([
            'IdBorrow' => $borrow->getIdBorrow(),
            'StartDate' => $borrow->getStartDate(),
            'message' => 'Borrow returned successfully',
        ],Response::HTTP_OK );
    }
   

    #[OA\Tag(name: "Borrow")]
    #[OA\Parameter(
        name: "idBorrow",
        in: "query",
        description: "id of the borrow to return",
        required: true,
    )]
    #[OA\Response(
        response: "200",
        description: "The borrow has been returned successfully",
    )]
    #[OA\Response(
        response: "404",
        description: "Borrow not found",
    )]
    #[OA\Response(
        response: "500",
        description: "Query syntax error",
    )]
    #[AnnotationsView(serializerGroups: ['emprunt'])]
    #[Route('/borrow/rendre', name: 'app_api_borrow_rendre', methods: "GET")]
    public function rendre(
        EntityManagerInterface $em,
        Request $request,
        BorrowRepository $borrow,
    ) {
        $idBorrow = $request->query->get('idBorrow');
        $idBorrow = $borrow->findById($idBorrow);
        if ($idBorrow === null) {
            return new JsonResponse(['error' => 'No borrows found'], Response::HTTP_NOT_FOUND);
        }
        $date = new \DateTime();
        $idBorrow->setEndDate($date);
        $em->persist($idBorrow);
        $em->flush();
        return $this->json([
            'EndDate' => $date,
            'message' => 'success',
        ], Response::HTTP_OK);
    }
  

    //AUTHENTIFICATION

    #[OA\Tag(name: "Authentification")]
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
        description: "Query syntax error",
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

    #[OA\Tag(name: "Authentification")]
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
