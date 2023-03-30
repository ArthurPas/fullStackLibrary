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
    * Request who finds an author by his id
    */
    public function findAuthorById(int $id): array
    {
        return $this->createQueryBuilder('a')
           ->select('a.authorName')
           ->andWhere('a.idAuthor = :id')
           ->setParameter('id', $id)
           ->getQuery()
           ->getResult();
    }
   /**
    * Request that finds all the author with the same
    * beginning of the name
    */
    public function autocompleter(string $mot): array
    {
        return $this->createQueryBuilder('a')
           ->andWhere('a.authorName LIKE :mot')
           ->setParameter('mot', '%' . $mot . '%')
           ->setMaxResults(10)
           ->getQuery()
           ->getResult();
    }
//    /**
//     * @return Author[] Returns an array of Author objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('a')
//            ->andWhere('a.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('a.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }


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
