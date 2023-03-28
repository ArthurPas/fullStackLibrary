<?php

namespace App\Repository;

use App\Entity\User;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query\Expr\Join;

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

    public function findByUserIsFollowed(int $id): array
    {
        return $this->createQueryBuilder('u')
            ->select('u.idUser, u.firstname, u.lastname, u.email, u.avatar')
            ->innerJoin('u.idUserIsFollowed', 'f', Join::WITH, 'f.idUser = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getResult();
    }

    public function findUserFollowings(int $id): array
    {
        return $this->createQueryBuilder('u')
            ->select('u.idUser, u.firstname, u.lastname, u.email, u.avatar')
            ->innerJoin('u.idUserFollow', 'f')
            ->where('f.idUser = :userId')
            ->setParameter('userId', $id)
            ->getQuery()
            ->getResult();
    }





    public function infoUser(int $id): array
    {
        return $this->createQueryBuilder('u')
            ->select('u.idUser, u.firstname, u.lastname, u.email, u.avatar')
            ->where('u.idUser = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getResult();
    }


    public function findById(int $id): ?User
    {
        return $this->createQueryBuilder('u')
            ->where('u.idUser = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getOneOrNullResult();
    }


    // public function follow(User $user, User $followedUser): void
    // {
    //     $user->addFollowedUser($followedUser);
    //     $this->save($user, true);
    // }

    // public function listFollowedUsers(User $user): array
    // {
    //     return $user->getFollowedUsers()->toArray();
    // }

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

    public function findOneByToken($token): ?User
    {
        return $this->createQueryBuilder('u')
            ->andWhere('u.token = :token')
            ->setParameter('token', $token)
            ->getQuery()
            ->getOneOrNullResult();
        ;
    }
}
