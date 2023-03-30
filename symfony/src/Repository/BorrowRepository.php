<?php

namespace App\Repository;

use App\Entity\Borrow;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Borrow>
 *
 * @method Borrow|null find($id, $lockMode = null, $lockVersion = null)
 * @method Borrow|null findOneBy(array $criteria, array $orderBy = null)
 * @method Borrow[]    findAll()
 * @method Borrow[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class BorrowRepository extends ServiceEntityRepository
{
    private BookRepository $bookRepository;

    public function __construct(ManagerRegistry $registry, BookRepository $bookRepository)
    {
        parent::__construct($registry, Borrow::class);
        $this->bookRepository = $bookRepository;
    }

    public function save(Borrow $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Borrow $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function findSomeBorrowNotReturned(): array
    {
        return $this->createQueryBuilder('b')
        ->andWhere('b.endDate IS NULL')
        ->getQuery()
        ->getResult()
        ;
    }

    /**
     * Request that find the borrows of an user
     */
    public function findBorrowByUser($utilisateur): array
    {
        $sql = "SELECT b.id_book, b.title, b.image, b.description, b.number_of_pages, b.editor, b.release_date,
                    GROUP_CONCAT(a.author_name) as author_names
                FROM BOOK b
                LEFT JOIN WWRITE w ON b.id_book = w.id_book
                LEFT JOIN AUTHOR a ON w.id_author = a.id_author
                WHERE b.id_book IN (
                    SELECT bo.id_book
                    FROM BORROW bo
                    LEFT JOIN USER u ON bo.id_user = u.id_user
                    WHERE u.email = '$utilisateur'
                )
                GROUP BY b.id_book
                ORDER BY b.id_book DESC";


        return $this->bookRepository->getBookQuery($sql);
    }

    public function findBorrowByIdUser($id): array
    {
        return $this->createQueryBuilder('bo')
            ->leftJoin('bo.idUser', 'u')
            ->leftJoin('bo.idBook', 'b')
            ->select('bo.endDate, bo.startDate, b.idBook, b.title, b.image', 'b.description, 
            b.numberOfPages, b.editor, b.releaseDate', 'bo.idBorrow')
            ->andWhere('u.idUser = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getResult();
    }

    /**
     * Request that find the date of a borrow by its id
     */
    public function findDateOfBorrow($id): array
    {
        return $this->createQueryBuilder('bo')
            ->select('bo.startDate, bo.endDate')
            ->andWhere('bo.idBorrow = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getResult();
    }
    /**
     * Request that finds a borrow by its id
     */
    public function findById(int $id): ?Borrow
    {
        return $this->createQueryBuilder('bo')
            ->andWhere('bo.idBorrow = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getOneOrNullResult();
    }
}
