<?php

namespace App\Entity;

use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

/**
 * Author
 *
 * @ORM\Table(name="AUTHOR")
 * @ORM\Entity
 */
class Author
{
    /**
     * @var int
     *
     * @ORM\Column(name="ID_AUTHOR", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idAuthor;

    /**
     * @var string|null
     *
     * @ORM\Column(name="AUTHOR_NAME", type="string", length=255, nullable=true, options={"fixed"=true})
     */
    private $authorName;

    public function getIdAuthor(): ?string
    {
        return $this->idAuthor;
    }

    public function getAuthorName(): ?string
    {
        return $this->authorName;
    }

    public function setAuthorName(?string $authorName): self
    {
        $this->authorName = $authorName;

        return $this;
    }
}
