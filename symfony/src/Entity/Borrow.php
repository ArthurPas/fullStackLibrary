<?php

namespace App\Entity;

use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use App\Entity\Book;
use App\Entity\User;


/**
 * Borrow
 *
 * @ORM\Table(name="BORROW", indexes={@ORM\Index(name="I_FK_BORROW_BOOK", columns={"ID_BOOK"}), @ORM\Index(name="I_FK_BORROW_USER", columns={"ID_USER"})})
 * @ORM\Entity
 * @ORM\Entity(repositoryClass="App\Repository\BorrowRepository")
 */
class Borrow
{
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: 'IDENTITY')]
    #[ORM\Column(name: 'ID_BORROW', type: Types::BIGINT, nullable: false)]
    private $idBorrow;

    #[ORM\Column(name: 'START_DATE', type: Types::DATE_MUTABLE, nullable: false)]
    private $startDate;

    #[ORM\Column(name: 'END_DATE', type: Types::DATE_MUTABLE, nullable: true)]
    private $endDate;

    #[ORM\Column(name: 'NOTE', type: Types::STRING, length: 255, nullable: false, options: ['fixed' => true])]
    private $note;

    #[ORM\ManyToOne(targetEntity: Book::class)]
    #[ORM\JoinColumn(name: 'ID_BOOK', referencedColumnName: 'ID_BOOK')]
    private $idBook;

    #[ORM\ManyToOne(targetEntity: User::class)]
    #[ORM\JoinColumn(name: 'ID_USER', referencedColumnName: 'ID_USER')]
    private $idUser;

    public function getIdBorrow(): ?string
    {
        return $this->idBorrow;
    }

    public function getStartDate(): ?\DateTimeInterface
    {
        return $this->startDate;
    }

    public function setStartDate(\DateTimeInterface $startDate): self
    {
        $this->startDate = $startDate;

        return $this;
    }

    public function getEndDate(): ?\DateTimeInterface
    {
        return $this->endDate;
    }

    public function setEndDate(?\DateTimeInterface $endDate): self
    {
        $this->endDate = $endDate;

        return $this;
    }

    public function getNote(): ?string
    {
        return $this->note;
    }

    public function setNote(string $note): self
    {
        $this->note = $note;

        return $this;
    }

    public function getIdBook(): ?Book
    {
        return $this->idBook;
    }

    public function setIdBook(?Book $idBook): self
    {
        $this->idBook = $idBook;

        return $this;
    }

    public function getIdUser(): ?User
    {
        return $this->idUser;
    }

    public function setIdUser(?User $idUser): self
    {
        $this->idUser = $idUser;

        return $this;
    }


}
