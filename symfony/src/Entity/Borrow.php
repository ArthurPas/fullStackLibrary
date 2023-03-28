<?php

namespace App\Entity;

use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * Borrow
 *
 * @ORM\Table(name="BORROW", indexes={@ORM\Index(name="I_FK_BORROW_BOOK", columns={"ID_BOOK"}),
 * @ORM\Index(name="I_FK_BORROW_USER", columns={"ID_USER"})})
 * @ORM\Entity
 */
class Borrow
{
    /**
     * @var int
     *
     * @ORM\Column(name="ID_BORROW", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idBorrow;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="START_DATE", type="date", nullable=false)
     */
    #[Groups(['emprunt'])]
    private $startDate;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="END_DATE", type="date", nullable=true)
     */
    #[Groups(['emprunt'])]
    private $endDate;

    /**
     * @var \User
     *
     * @ORM\ManyToOne(targetEntity="User")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="ID_USER", referencedColumnName="ID_USER")
     * })
     */
    #[Groups(['emprunt'])]
    private $idUser;

    /**
     * @var \Book
     *
     * @ORM\ManyToOne(targetEntity="Book")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="ID_BOOK", referencedColumnName="ID_BOOK")
     * })
     */
    #[Groups(['emprunt'])]
    private $idBook;

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

    public function getIdUser(): ?User
    {
        return $this->idUser;
    }

    public function setIdUser(?User $idUser): self
    {
        $this->idUser = $idUser;

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
}
