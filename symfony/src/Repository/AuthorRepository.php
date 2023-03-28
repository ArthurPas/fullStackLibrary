<?php

namespace App\Repository;

use App\Entity\Author;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Author>
 *
 * @method Author|null find($id, $lockMode = null, $lockVersion = null)
 * @method Author|null findOneBy(array $criteria, array $orderBy = null)
 * @method Author[]    findAll()
 * @method Author[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AuthorRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Author::class);
    }

    public function save(Author $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Author $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

   /**
    * @return Author[] Returns an array of Author objects
    */
    public function findSomeWithoutBook(): array
    {
        return $this->createQueryBuilder('a')
           ->leftJoin('a.idBook', 'w')
           ->groupBy('a.idAuthor')
           ->having('count(w.idBook) = :val')
           ->setParameter('val', 0)
           ->getQuery()
           ->getScalarResult()
        ;
    }

    public function findSomeWithSeveralBooks(): array
    {
        return $this->createQueryBuilder('a')
           ->innerJoin('a.idBook', 'w')
           ->groupBy('a.idAuthor')
           ->having('count(w.idBook) > :val')
           ->setParameter('val', 1)
           ->getQuery()
           ->getScalarResult()
        ;
    }

    public function findSomeWithOneBook(): array
    {
        return $this->createQueryBuilder('a')
           ->innerJoin('a.idBook', 'w')
           ->groupBy('a.idAuthor')
           ->having('count(w.idBook) = :val')
           ->setParameter('val', 1)
           ->getQuery()
           ->getScalarResult()
        ;
    }


//    public function findOneBySomeField($value): ?Author
//    {
//        return $this->createQueryBuilder('a')
//            ->andWhere('a.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
