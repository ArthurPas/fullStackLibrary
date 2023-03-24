<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Table(name: "CATEGORY")]
#[ORM\Entity(repositoryClass: "App\Repository\CategoryRepository")]
class Category
{
    #[ORM\Column(name: "ID_CATEGORY", type: "bigint", nullable: false)]
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: "IDENTITY")]
    private $idCategory;

    #[ORM\Column(name: "CATEGORY_NAME", type: "string", length: 255, nullable: false, options: ["fixed" => true])]
    private $categoryName;

    #[ORM\ManyToMany(targetEntity: Book::class, mappedBy: "idCategory")]
    private $idBook = array();

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->idBook = new \Doctrine\Common\Collections\ArrayCollection();
    }

    public function getIdCategory(): ?string
    {
        return $this->idCategory;
    }

    public function getCategoryName(): ?string
    {
        return $this->categoryName;
    }

    public function setCategoryName(string $categoryName): self
    {
        $this->categoryName = $categoryName;

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
            $idBook->addIdCategory($this);
        }

        return $this;
    }

    public function removeIdBook(Book $idBook): self
    {
        if ($this->idBook->removeElement($idBook)) {
            $idBook->removeIdCategory($this);
        }

        return $this;
    }

}
