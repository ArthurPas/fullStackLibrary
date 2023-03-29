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

    public function findByNb(int $nb, string $type): array
    {
        if ($type != 'ASC' && $type != 'DESC')return [];
        return $this->createQueryBuilder('b')
            ->leftJoin('b.idAuthor', 'a')
            ->leftJoin('b.idCategory', 'c')
            ->leftJoin('b.idLanguage', 'l')
            ->orderBy('b.idBook', $type)
            ->select('b.title, b.idBook, b.image, b.description, b.numberOfPages, b.editor, b.releaseDate, 
            a.idAuthor, c.idCategory, l.idLanguage')
            ->setMaxResults($nb)
            ->getQuery()
            ->getResult();
    }

    public function findByAuthor(string $author): array
    {
        return $this->createQueryBuilder('b')
            ->leftJoin('b.idAuthor', 'a')
            ->leftJoin('b.idCategory', 'c')
            ->leftJoin('b.idUser', 'u')
            ->select('b.title, b.idBook, b.image, b.description, b.numberOfPages, b.editor, b.releaseDate, 
            a.idAuthor, c.idCategory, a.idAuthor, u.idUser')
            ->andWhere('a.authorName LIKE :author_name')
            ->setParameter('author_name', '%' . $author . '%')
            ->getQuery()
            ->getResult();
    }

    public function findByUser(string $utilisateur): array
    {
        return $this->createQueryBuilder('b')
            ->leftJoin(
                'App\Entity\Borrow',
                'bo',
                'WITH',
                'b.idBook = bo.idBook'
            )
            ->leftJoin(
                'App\Entity\User',
                'u',
                'WITH',
                'u.idUser = bo.idUser'
            )
            ->select('b, bo, u')
            ->where('u.firstname = :utilisateur')
            ->andWhere('bo.idUser = u.idUser')
            ->setParameter('utilisateur', $utilisateur)
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
