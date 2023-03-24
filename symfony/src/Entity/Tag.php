<?php

namespace App\Entity;

use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

/**
 * Tag
 *
 * @ORM\Table(name="TAG", indexes={@ORM\Index(name="I_FK_TAG_CATEGORY", columns={"ID_CATEGORY"}),
 * @ORM\Index(name="I_FK_TAG_BOOK", columns={"ID_BOOK"})})
 * @ORM\Entity
 */
class Tag
{
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
     * @ORM\Column(name="ID_CATEGORY", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $idCategory;

    public function getIdBook(): ?string
    {
        return $this->idBook;
    }

    public function getIdCategory(): ?string
    {
        return $this->idCategory;
    }
    
}
