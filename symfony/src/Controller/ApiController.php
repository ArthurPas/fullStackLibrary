<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Borrow;
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
use OpenApi\Attributes as OA;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Validator\Constraints\DateTime;

#[Route('/api')]
class ApiController extends AbstractController
{
    /**
     * Route that returns a json of the books from an author or from
     * a title or a number of books depending on the number in the URL
     * param "nbResults" sorted by recent or old depending on the
     * param "type" but not all in the same time only "nbResults" and
     * "type" can be combined
     * If there is not parameters the route return a json with all
     * the books
     */


    #[OA\Tag(name: "Books")]
    #[OA\Parameter(
        name: "author",
        in: "query",
        description: "Get the book by author name (need to be alone)",
        required: false,
        schema: new OA\Schema(ref: "#/components/schemas/Books/properties/author")
    )]
    #[OA\Parameter(
        name: "title",
        in: "query",
        description: "Get the book by title (need to be alone)",
        required: false,
        schema: new OA\Schema(ref: "#/components/schemas/Books/properties/title")
    )]
    #[OA\Parameter(
        name: "nbResults",
        in: "query",
        description: "Number of books to retrieve (need to be with type)",
        required: false,
        schema: new OA\Schema(ref: "#/components/schemas/Books/properties/nbResults")
    )]
    #[OA\Parameter(
        name: "type",
        in: "query",
        description: "Type of books to retrieve (need to be with nbResults)",
        example: "ASC or DESC",
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
    #[AnnotationsView(serializerGroups: ['Books'])]
    #[Route('/books', name: 'app_api', methods: "GET")]
    public function index(
        Request $request,
        BookRepository $book
    ) {
        $author = $request->query->get('author');
        $nbResults = $request->query->get('nbResults');
        $type = $request->query->get('type');
        $title = $request->query->get('title');
        if ($author != null) {
            return $book->findByAuthor($author);
        } elseif ($title != null) {
            return $book->findByTitle($title);
        } elseif ($nbResults != null && $type != null) {
            return $book->findByNb($nbResults, $type);
        }
        return $book->findAll();
    }


    /**
     * Route that returns the book depending on his id
     */
    #[OA\Tag(name: "Books")]
    #[OA\Parameter(
        name: "id",
        in: "path",
        description: "Get the book by id",
        required: true,
    )]
    #[OA\Response(
        response: "200",
        description: "Book information retrieved successfully",
    )]
    #[OA\Response(
        response: "404",
        description: "No book found",
    )]
    #[OA\Response(
        response: "500",
        description: "Query syntax error",
    )]
    #[AnnotationsView(serializerGroups: ['Books'])]
    #[Route('/book/{id}', name: 'app_api_book', methods: "GET")]
    public function getBook(BookRepository $book, int $id)
    {
        $book = $book->findById($id);
        if ($book == null) { // if there is not any book with this id
            return new JsonResponse(['error' => 'This book doesn\'t exists'], Response::HTTP_NOT_FOUND);
        }
        return $book;
    }

    /**
     * Route that returns the author depending on his id
     */
    #[OA\Tag(name: "Author")]
    #[OA\Parameter(
        name: "id",
        in: "path",
        description: "Get the author by id",
        required: true,
    )]
    #[OA\Response(
        response: "200",
        description: "Author information retrieved successfully",
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
    #[Route('/author/{id}', name: 'app_api_author', methods: "GET")]
    public function getAuthorById(AuthorRepository $a, int $id)
    {
        $author = $a->findAuthorById($id);
        if (count($author) === 0) { // if there is not any result of the request
            return new JsonResponse(['error' => 'No author found'], Response::HTTP_NOT_FOUND);
        }
        return $author;
    }

    /**
     * Route that returns the author depending on the book id
     */
    #[OA\Tag(name: "Author")]
    #[OA\Parameter(
        name: "id",
        in: "path",
        description: "Get the author by book id",
        required: true,
    )]
    #[OA\Response(
        response: "200",
        description: "Author information retrieved successfully",
    )]
    #[OA\Response(
        response: "404",
        description: "No book found",
    )]
    #[OA\Response(
        response: "500",
        description: "Query syntax error",
    )]
    #[AnnotationsView()]
    #[Route('/author/book/{id}', name: 'app_api_authorbybook', methods: "GET")]
    public function getAuthorByBookId(BookRepository $b, int $id)
    {
        $books = $b->findTitleByBookId($id);
        $author = $b->findAuthorByBookId($id);
        if (count($author) === 0) { // if there is not any result of the request
            return new JsonResponse(['error' => 'No author or book found'], Response::HTTP_NOT_FOUND);
        }
        return $books + $author;
    }

    /**
     * Route that returns all the user that a user follow by his id
     */
    #[OA\Tag(name: "Follow")]
    #[OA\Parameter(
        name: "id",
        in: "path",
        description: "The ID of the user to get the list of the users he follows",
        required: true,
        schema: new OA\Schema(ref: "#/components/schemas/Follow(ed)/properties/idUser")
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
        if ($exist == null) { // if there is not any user with this id
            return new JsonResponse(['error' => 'No users found'], Response::HTTP_NOT_FOUND);
        }
        $users = $userRepository->findUserFollowings($id);
        if (count($users) === 0) { // if the request return 0 lines
            return new JsonResponse(['error' => 'This person follow nobody'], Response::HTTP_NOT_FOUND);
        }
        return $this->json($users);
    }

    /**
     * Route that returns all the followers of an user
     */
    #[OA\Tag(name: "Follow")]
    #[OA\Parameter(
        name: "id",
        in: "path",
        description: "The ID of the user to get the list of the users who follow him",
        required: true,
        schema: new OA\Schema(ref: "#/components/schemas/Follow(ed)/properties/idUserFollowed")
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
        if ($exist == null) { // if there is not any user with this id
            return new JsonResponse(['error' => 'No users found'], Response::HTTP_NOT_FOUND);
        }
        $users = $userRepository->findByUserIsFollowed($id);
        if (count($users) === 0) { // if the request return 0 lines
            return new JsonResponse(['error' => 'Nobody follow this person'], Response::HTTP_NOT_FOUND);
        }
        return $this->json($users);
    }


    /**
     * Route that allows a user to follow another user
     */
    #[OA\Tag(name: "Follow")]
    #[OA\Parameter(
        name: "idUser",
        in: "query",
        description: "id of the user who wants to follow",
        required: true,
        schema: new OA\Schema(ref: "#/components/schemas/Follow(ed)/properties/idUser")
    )]
    #[OA\Parameter(
        name: "idUserFollowed",
        in: "query",
        description: "id of the user followed",
        required: true,
        schema: new OA\Schema(ref: "#/components/schemas/Follow(ed)/properties/idUserFollowed")
    )]
    #[OA\Response(
        response: "200",
        description: "Followed successfully",
    )]
    #[OA\Response(
        response: "404",
        description: "User not found",
    )]
    #[OA\Response(
        response: "500",
        description: "Query syntax error",
    )]
    #[Route('/addfollow', name: 'app_addfollow_id', methods: "GET")]
    public function addfollowId(Request $request, UserRepository $userRepository): Response
    {
        $id = $request->query->get('idUser');
        $idfollow = $request->query->get('idUserFollowed');
        $exist = $userRepository->find($id);
        $existfollow = $userRepository->find($idfollow);
        if ($exist == null || $existfollow == null) {
            return new JsonResponse(['error' => 'No users found'], Response::HTTP_NOT_FOUND);
        }
        $userRepository->addFollow($idfollow, $id);
        return $this->json([
            'message' => 'Followed successfully',
            'userFollowed' => $idfollow,
        ]);
    }


    /**
     * Route that allows a user to unfollow another user
     */
    #[OA\Tag(name: "Follow")]
    #[OA\Parameter(
        name: "idUser",
        in: "query",
        description: "id of the user who wants to unfollow",
        required: true,
        schema: new OA\Schema(ref: "#/components/schemas/Follow(ed)/properties/idUser")
    )]
    #[OA\Parameter(
        name: "idUserFollowed",
        in: "query",
        description: "id of the user who will be unfollowed",
        required: true,
        schema: new OA\Schema(ref: "#/components/schemas/Follow(ed)/properties/idUserFollowed")
    )]
    #[OA\Response(
        response: "200",
        description: "The user is no longer followed",
    )]
    #[OA\Response(
        response: "404",
        description: "User not found",
    )]
    #[OA\Response(
        response: "500",
        description: "Query syntax error",
    )]
    #[Route('/unfollow', name: 'app_unfollow_id', methods: "DELETE")]
    public function unFollow(Request $request, UserRepository $userRepository): Response
    {
        $id = $request->query->get('idUser');
        $idfollow = $request->query->get('idUserFollowed');
        $exist = $userRepository->find($id);
        $existfollow = $userRepository->find($idfollow);
        if ($exist == null || $existfollow == null) {
            return new JsonResponse(['error' => 'No users found'], Response::HTTP_NOT_FOUND);
        }
        $userRepository->unFollow($idfollow, $id);
        return $this->json([
            'message' => 'The user is no longer followed',
            'userFollowed' => $idfollow,
        ]);
    }

    /**
     * Return the info of an user by his id
     */

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
        if (count($users) === 0) { //if the request return 0 lines
            return new JsonResponse(['error' => 'No users found'], Response::HTTP_NOT_FOUND);
        }
        return $this->json($users);
    }

    /**
     * Route that returns a list of author with the same begining of their name
     */

    #[OA\Tag(name: "Author")]
    #[OA\Parameter(
        name: "startby",
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
    #[OA\Response(
        response: "500",
        description: "Query syntax error",
    )]

    #[AnnotationsView(serializerGroups: ['AuthorName'])]
    #[Route('/autocompletion', name: 'app_autocompletion', methods: "GET")]
    public function autocompletion(AuthorRepository $a, Request $request)
    {
        $startby = $request->query->get('startby');
        if (strlen($startby) >= 4) { // We only start at 4 character
            $author = $a->autocompletion($startby);
            if (count($author) === 0) { // if the request returns 0 line
                return new JsonResponse(['error' => 'No author found'], Response::HTTP_NO_CONTENT);
            }
            return $author;
        }
        return null;
    }

    #
    #[Route('/recommendation', name: 'app_recommendation', methods: "GET")]
    public function recommendation(Request $request, UserRepository $userRepository): Response
    {
        $id = $request->query->get('idUser');
        $exist = $userRepository->findById($id);
        if ($exist == null) {
            return new JsonResponse(['error' => 'No users found'], Response::HTTP_NOT_FOUND);
        }
        $recommendation = $userRepository->findRandomUsers($id);
        return $this->json($recommendation);
    }

    /**
     * Route that returns a paginated list of books.
     */
    #[OA\Tag(name: "Books")]
    #[OA\Parameter(
        name: "page",
        in: "query",
        description: "The page number of the results.",
        required: false,
        schema: new OA\Schema(ref: "#/components/schemas/Pagination/properties/page")
    )]
    #[OA\Parameter(
        name: "limit",
        in: "query",
        description: "The maximum number of results per page.",
        required: false,
        schema: new OA\Schema(ref: "#/components/schemas/Pagination/properties/limit")
    )]
    #[OA\Response(
        response: "200",
        description: "Paginated list of books retrieved successfully",
    )]
    #[OA\Response(
        response: "404",
        description: "No books found",
    )]
    #[OA\Response(
        response: "500",
        description: "Query syntax error",
    )]


    #[AnnotationsView(serializerGroups: ['Books'])]
    #[Route('/pagination', name: 'app_api_pagination', methods: "GET")]
    public function pagination(Request $request, BookRepository $book)
    {
        $page = $request->query->getInt('page');
        $limit = $request->query->getInt('limit');
        $books = $book->findPaginated($page, $limit);

        if (count($books) === 0) { // if the request returns 0 line
            return new JsonResponse(['error' => 'No books found'], Response::HTTP_NOT_FOUND);
        }
        return $books;
    }

    /**
     * Route that returns all the books borrowed by an user
     */


    #[OA\Tag(name: "Borrow")]
    #[OA\Parameter(
        name: "user",
        in: "path",
        description: "Get the list of books that the user has borrowed by his email or id",
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
    #[OA\Response(
        response: "500",
        description: "Query syntax error",
    )]
    #[AnnotationsView(serializerGroups: ['borrow'])]
    #[Route('/borrow/user/{user}', name: 'app_api_borrow_user', methods: "GET")]
    public function getBorrowByUser(BorrowRepository $borrow, string $user)
    {
        if (!filter_var($user, FILTER_VALIDATE_EMAIL)) {
            $borrows = $borrow->findBorrowByIdUser($user);
        } else {
            $borrows = $borrow->findBorrowByUser($user);
        }
        if (count($borrows) === 0) { // if the request return 0 line
            return new JsonResponse(['error' => 'No borrows or users found'], Response::HTTP_OK);
        }
        return $borrows;
    }

    /**
     * Route that return the dates of the borrows from an id
     */
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
    #[OA\Response(
        response: "500",
        description: "Query syntax error",
    )]
    #[AnnotationsView(serializerGroups: ['borrow'])]
    #[Route('/borrow/date/{id}', name: 'app_api_borrow_date', methods: "GET")]
    public function getDateOfBorrow(BorrowRepository $borrow, int $id)
    {
        $borrows = $borrow->findDateOfBorrow($id);
        if (count($borrows) === 0) {
            return new JsonResponse(['error' => 'No borrows found'], Response::HTTP_NOT_FOUND);
        }
        return $borrows;
    }


    /**
     * Route that create a borrow and return a json with the borrow date,id and a success
     * message
     */
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
    #[AnnotationsView(serializerGroups: ['borrow'])]
    #[Route('/borrow/new', name: 'app_api_borrow_new', methods: "GET")]
    public function newBorrow(
        EntityManagerInterface $em,
        Request $request,
        BorrowRepository $borrow,
        BookRepository $book,
        UserRepository $user
    ) {
        $idBook = $request->query->get('idBook');
        $idBook = $book->findByIds($idBook);
        $idUser = $request->query->get('idUser');
        $idUser = $user->findById($idUser);
        if ($idBook === null && $idUser === null) {
            return new JsonResponse(['error' => 'No books and users found'], Response::HTTP_NOT_FOUND);
        } elseif ($idBook === null) {
            return new JsonResponse(['error' => 'No books found'], Response::HTTP_NOT_FOUND);
        } elseif ($idUser === null) {
            return new JsonResponse(['error' => 'No users found'], Response::HTTP_NOT_FOUND);
        }
        $date = new \DateTime();
        $borrow = new Borrow();
        $borrow->setStartDate($date);
        $borrow->setIdUser($idUser);
        $borrow->setIdBook($idBook);
        $em->persist($borrow);
        $em->flush();
        return $this->json([
            'IdBorrow' => $borrow->getIdBorrow(),
            'StartDate' => $borrow->getStartDate(),
            'user' => $borrow->getIdUser()->getEmail(),
            'message' => 'Borrow created'
        ], Response::HTTP_OK);
    }


    /**
     * Route that "return" the borrow and return a json with the endDate and a message
     */
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
    #[AnnotationsView(serializerGroups: ['borrow'])]
    #[Route('/borrow/return', name: 'app_api_borrow_return', methods: "GET")]
    public function return(
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
            'message' => 'Borrow returned successfully',
        ], Response::HTTP_OK);
    }




    /**
     * Route that handle the login from an user and return in a json
     * the tokken, the user and a message
     */


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
            if ($ExpectedUser->getToken() == null) {
                $token = rtrim(strtr(base64_encode(random_bytes(32)), '+/', '-'), '=');
                $ExpectedUser->setToken($token);
                $ur->save($ExpectedUser, true);
            }
            $token = $ExpectedUser->getToken();
            return $this->json([
                'accessToken' => $token,
                'user' => $ExpectedUser,
                'message' => 'success login',
            ], Response::HTTP_OK);
        } else {
            return $this->json([
                'message' => 'error',
            ], Response::HTTP_UNAUTHORIZED);
        }
    }
    /**
     * Route that handle the logout from an user and return a message
     */
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
        Request $request,
        UserRepository $ur
    ): Response {
        $userToken = json_decode($request->getContent(), true);
        $ExpectedUser = $ur->findOneByToken($userToken['token']);
        if ($ExpectedUser == null) {
            return $this->json([
                'message' => 'error',
            ], Response::HTTP_BAD_REQUEST);
        }
        return $this->json([
            'message' => 'success logout',
        ], Response::HTTP_OK);
    }
}
