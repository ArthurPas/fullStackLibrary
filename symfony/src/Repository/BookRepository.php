<?php

namespace App\Repository;

use App\Entity\Book;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
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
    * Request that finds a certain number of books
    * depending on the param nb. It will be sorted
    * by ASC if the param is "recent" and DESC if
    * it's "old"
    */

    public function findByNb(int $nb, string $type): array
    {
        if ($type == "recent") {
            return $this->createQueryBuilder('b')
                ->orderBy('b.idBook', 'DESC')
                ->setMaxResults($nb)
                ->getQuery()
                ->getResult();
        } elseif ($type == "old") {
            return $this->createQueryBuilder('b')
                ->orderBy('b.idBook', 'ASC')
                ->setMaxResults($nb)
                ->getQuery()
                ->getResult();
        }
        return [];
    }
    /**
    * Request that find the books from an author
    */

    public function findByAuthor(string $author): array
    {
        return $this->createQueryBuilder('b')
            ->leftJoin('b.idAuthor', 'a')
            ->leftJoin('b.idCategory', 'c')
            ->leftJoin('b.idUser', 'u')
            ->select('b, a, c, u')
            ->andWhere('a.authorName LIKE :author_name')
            ->setParameter('author_name', '%' . $author . '%')
            ->getQuery()
            ->getResult();
    }
    /**
    * Request that find a book by its id
    */

    public function findById(int $id): ?Book
    {
        return $this->createQueryBuilder('b')
            ->where('b.idBook = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getOneOrNullResult();
    }
    /**
    * Request that find books by a part of its
    * title
    */

    public function findByTitle(string $title)
    {
        return $this->createQueryBuilder('b')
            ->where('b.title LIKE :title')
            ->setParameter('title', '%' . $title . '%')
            ->getQuery()
            ->getResult();
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
