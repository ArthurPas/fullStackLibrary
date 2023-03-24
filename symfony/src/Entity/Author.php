<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Table(name: "AUTHOR")]
#[ORM\Entity(repositoryClass: "App\Repository\AuthorRepository")]
class Author
{
    #[ORM\Column(name: "ID_AUTHOR", type: "bigint", nullable: false)]
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: "IDENTITY")]
    private $idAuthor;

    #[ORM\Column(name: "AUTHOR_NAME", type: "string", length: 255, nullable: true, options: ["fixed" => true])]
    private $authorName;

    #[ORM\ManyToMany(targetEntity: Book::class, mappedBy: "idAuthor")]
    private $idBook;

    public function __construct()
    {
        $this->idBook = new ArrayCollection();
    }


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

    /**
     * @return Collection<int, Book>
     */
    public function getIdBook(): Collection
    {
        return $this->idBook;
    }

    public function addIdBook(Book $idBook): self
    {
        if (!$this->idBook->contains($idBook)) {
            $this->idBook->add($idBook);
        }

        return $this;
    }

    public function removeIdBook(Book $idBook): self
    {
        $this->idBook->removeElement($idBook);

        return $this;
    }

}
