<?php

namespace App\Entity;

use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

/**
 * Rating
 *
 * @ORM\Table(name="RATING", indexes={@ORM\Index(name="I_FK_RATING_USER", columns={"ID_USER"}), @ORM\Index(name="I_FK_RATING_BOOK", columns={"ID_BOOK"})})
 * @ORM\Entity
 */
class Rating
{
    /**
     * @var int
     *
     * @ORM\Column(name="ID_USER", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $idUser;

    /**
     * @var int
     *
     * @ORM\Column(name="ID_BOOK", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $idBook;

    /**
     * @var int
     *
     * @ORM\Column(name="RATE", type="bigint", nullable=false)
     */
    private $rate;

    public function getIdUser(): ?string
    {
        return $this->idUser;
    }

    public function getIdBook(): ?string
    {
        return $this->idBook;
    }

    public function getRate(): ?string
    {
        return $this->rate;
    }

    public function setRate(string $rate): self
    {
        $this->rate = $rate;

        return $this;
    }
}
