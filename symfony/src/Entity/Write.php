<?php

namespace App\Entity;

use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

/**
 * Write
 *
 * @ORM\Table(name="WRITE", indexes={@ORM\Index(name="I_FK_WRITE_BOOK", columns={"ID_BOOK"}),
 * @ORM\Index(name="I_FK_WRITE_AUTHOR", columns={"ID_AUTHOR"})})
 * @ORM\Entity
 */
class Write
{
    /**
     * @var int
     *
     * @ORM\Column(name="ID_AUTHOR", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $idAuthor;

    /**
     * @var int
     *
     * @ORM\Column(name="ID_BOOK", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $idBook;

    public function getIdAuthor(): ?string
    {
        return $this->idAuthor;
    }

    public function getIdBook(): ?string
    {
        return $this->idBook;
    }
}
