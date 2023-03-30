<?php

namespace App\Repository;

use App\Entity\Book;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Query\ResultSetMapping;
use Doctrine\ORM\Query\ResultSetMappingBuilder;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Book>
 *
 * @method Book|null find($id, $lockMode = null, $lockVersion = null)
 * @method Book|null findOneBy(array $criteria, array $orderBy = null)
 * @method Book[]    findAll()
 * @method Book[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class BookRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Book::class);
    }

    public function save(Book $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Book $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    /**
     * Request that find the books from a his id 
     */
    public function findOneById($value): ?Book
    {
        return $this->createQueryBuilder('b')
            ->andWhere('b.idBook = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult();
    }

    /*
    * Request that find the books from a his title
    */
    public function findSomeWithSeveralAuthors(): array
    {
        return $this->createQueryBuilder('b')
            ->innerjoin('b.idAuthor', 'a')
            ->groupBy('b.idBook')
            ->having('COUNT(a.idAuthor) > :val')
            ->setParameter('val', 1)
            ->getQuery()
            ->getScalarResult();
    }

    public function findSomeWithOneAuthor(): array
    {
        return $this->createQueryBuilder('b')
            ->innerjoin('b.idAuthor', 'a')
            ->groupBy('b.idBook')
            ->having('COUNT(a.idAuthor) = :val')
            ->setParameter('val', 1)
            ->getQuery()
            ->getScalarResult();
    }
    public function findByNb(int $nb, string $type): array
    {
        if ($type != 'ASC' && $type != 'DESC') {
            return [];
        }
        $sql = "SELECT b.id_book, b.title, b.image, b.description, b.number_of_pages, 
                    b.editor, b.release_date, 
                    GROUP_CONCAT(a.author_name) as author_names
                FROM BOOK b
                LEFT JOIN WWRITE w ON b.id_book = w.id_book
                LEFT JOIN AUTHOR a ON w.id_author = a.id_author
                GROUP BY b.id_book
                ORDER BY b.id_book $type
                LIMIT $nb";

        $books = $this->getBookQuery($sql);

        return $books;
    }

    /**
     * Request that find the books from an author
     */
    public function findByAuthor(string $author): ?array
    {
        $sql = "SELECT b.id_book, b.title, b.image, b.description, b.number_of_pages, b.editor, 
                    b.release_date, GROUP_CONCAT(a.author_name) as author_names
                FROM BOOK b
                LEFT JOIN WWRITE w ON b.id_book = w.id_book
                LEFT JOIN AUTHOR a ON w.id_author = a.id_author
                WHERE a.author_name LIKE '%$author%'
                GROUP BY b.id_book";

        return $this->getBookQuery($sql);
    }
    /**
     * Request that find a book by its id
     */
    public function findByIds(int $id): ?Book
    {
        return $this->createQueryBuilder('b')
            ->where('b.idBook = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getOneOrNullResult();
    }

    public function findTitleByBookId(int $id): ?array
    {
        return $this->createQueryBuilder('b')
            ->select('b.title')
            ->where('b.idBook = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getOneOrNullResult();
    }

    /*
     * Request that find the author of a book by the id of the book
     */
    public function findAuthorByBookId(int $id): ?array
    {
        $sql = "SELECT a.author_name
                FROM AUTHOR a
                LEFT JOIN WWRITE w ON a.id_author = w.id_author
                LEFT JOIN BOOK b ON w.id_book = b.id_book
                WHERE b.id_book = $id";

        $rsm = new ResultSetMappingBuilder($this->getEntityManager());
        $rsm->addScalarResult('author_name', 'authorName');

        return $this->getEntityManager()->createNativeQuery($sql, $rsm)->getResult();
    }

    /*
     * Request that find the author of a book by its id
     */
    public function findById(int $id): ?array
    {
        $sql = "SELECT b.id_book, b.title, b.image, b.description, b.number_of_pages, b.editor, b.release_date, 
                    GROUP_CONCAT(a.author_name) as author_names
                FROM BOOK b
                LEFT JOIN WWRITE w ON b.id_book = w.id_book
                LEFT JOIN AUTHOR a ON w.id_author = a.id_author
                WHERE b.id_book = $id
                GROUP BY b.id_book
                ORDER BY b.id_book DESC
                LIMIT 4";

        return $this->getBookQuery($sql);
    }
    /**
     * Request that find books by a part of its
     * title
     */

    public function findByTitle(string $title)
    {
        $sql = "SELECT b.id_book, b.title, b.image, b.description, b.number_of_pages, b.editor, b.release_date, 
                    GROUP_CONCAT(a.author_name) as author_names
                FROM BOOK b
                LEFT JOIN WWRITE w ON b.id_book = w.id_book
                LEFT JOIN AUTHOR a ON w.id_author = a.id_author
                WHERE b.title LIKE '%$title%'
                GROUP BY b.id_book";

        return $this->getBookQuery($sql);
    }


    public function getBookQuery(string $sql)
    {
        $rsm = new ResultSetMappingBuilder($this->getEntityManager());
        $rsm->addScalarResult('id_book', 'idBook', 'integer');
        $rsm->addScalarResult('title', 'title');
        $rsm->addScalarResult('image', 'image');
        $rsm->addScalarResult('description', 'description');
        $rsm->addScalarResult('number_of_pages', 'numberOfPages', 'integer');
        $rsm->addScalarResult('editor', 'editor');
        $rsm->addScalarResult('release_date', 'releaseDate', 'datetime');
        $rsm->addScalarResult('author_names', 'authors');

        return $this->getEntityManager()->createNativeQuery($sql, $rsm)->getResult();
    }

    //    /**
    //     * @return Book[] Returns an array of Book objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('b')
    //            ->andWhere('b.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('b.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Book
    //    {
    //        return $this->createQueryBuilder('b')
    //            ->andWhere('b.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
