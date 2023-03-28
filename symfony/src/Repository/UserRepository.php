<?php

namespace App\Repository;

use App\Entity\User;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<User>
 *
 * @method User|null find($id, $lockMode = null, $lockVersion = null)
 * @method User|null findOneBy(array $criteria, array $orderBy = null)
 * @method User[]    findAll()
 * @method User[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class UserRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, User::class);
    }

    public function save(User $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(User $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

//    /**
//     * @return User[] Returns an array of User objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('u')
//            ->andWhere('u.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('u.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

    public function findOneByEmail($value): ?User
    {
        return $this->createQueryBuilder('u')
            ->andWhere('u.email = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }

    public function findSomeWithoutBorrow(): array
    {
        //compare les idUser de la table borrow avec ceux de la table user et compte le nombre de idUser qui ne sont pas dans la table borrow
        return $this->createQueryBuilder('u')
            ->select('u.idUser')
            ->leftJoin('App\Entity\Borrow', 'b', 'WITH', 'u.idUser = b.idUser')
            ->where('b.idUser IS NULL')
            ->getQuery()
            ->getScalarResult()
        ;
    }

    public function findSomeUserBorrowMoreThanOneBook(): array
    {
        // compte le nombre d'user qui ont emprunté plus d'un livre
        return $this->createQueryBuilder('u')
            ->select('u.idUser')
            ->leftJoin('App\Entity\Borrow', 'b', 'WITH', 'u.idUser = b.idUser')
            ->groupBy('u.idUser')
            ->having('COUNT(b.idUser) > 1')
            ->getQuery()
            ->getScalarResult()
        ;
    }

    public function findSomeUserBorrowSameBookTwice(): array
    {
        // compte le nombre d'user(idUser) qui ont emprunté le même livre(idBook) plus d'une fois
        return $this->createQueryBuilder('u')
            ->select('u.idUser')
            ->leftJoin('App\Entity\Borrow', 'b', 'WITH', 'u.idUser = b.idUser')
            ->groupBy('u.idUser, b.idBook')
            ->having('COUNT(b.idBook) > 1')
            ->getQuery()
            ->getScalarResult()
        ;
    }
}
