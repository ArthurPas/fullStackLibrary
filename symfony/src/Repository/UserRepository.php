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
    /**
     * Request that finds the followers of an user by its id
     */
    public function findByUserIsFollowed(int $id): array
    {
        return $this->createQueryBuilder('u')
            ->select('u.idUser, u.firstname, u.lastname, u.email, u.avatar')
            ->innerJoin('u.idUserIsFollowed', 'f', Join::WITH, 'f.idUser = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getResult();
    }
    /**
     * Request that finds the user that an user follows by its id
     */
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
    /**
     * Request that finds the information of an user by its id
     */
    public function infoUser(int $id): array
    {
        return $this->createQueryBuilder('u')
            ->select('u.idUser, u.firstname, u.lastname, u.email, u.avatar')
            ->where('u.idUser = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getResult();
    }
    /**
     * Request that find an user by its id
     */
    public function findById(int $id): ?User
    {
        return $this->createQueryBuilder('u')
            ->where('u.idUser = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getOneOrNullResult();
    }


    public function addFollow(int $id, int $idUser): void
    {
        $entityManager = $this->getEntityManager();
        $userRepo = $entityManager->getRepository(User::class);

        $user = $userRepo->find($id);
        $userToFollow = $userRepo->find($idUser);

        $user->addIdUserFollow($userToFollow);

        $entityManager->persist($user);
        $entityManager->flush();
    }

    public function unFollow(int $id, int $idUser): void
    {
        $entityManager = $this->getEntityManager();
        $userRepo = $entityManager->getRepository(User::class);

        $user = $userRepo->find($id);
        $userToUnfollow = $userRepo->find($idUser);

        $user->removeIdUserFollow($userToUnfollow);

        $entityManager->persist($user);
        $entityManager->flush();
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
            ->getOneOrNullResult();
    }

    public function findSomeWithoutBorrow(): array
    {
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
        return $this->createQueryBuilder('u')
        ->select('u.idUser')
        ->leftJoin('App\Entity\Borrow', 'b', 'WITH', 'u.idUser = b.idUser')
        ->groupBy('u.idUser, b.idBook')
        ->having('COUNT(b.idBook) > 1')
        ->getQuery()
        ->getScalarResult()
        ;
    }
    public function findOneByToken($token): ?User
    {
        return $this->createQueryBuilder('u')
            ->andWhere('u.token = :token')
            ->setParameter('token', $token)
            ->getQuery()
            ->getOneOrNullResult();
    }
}
