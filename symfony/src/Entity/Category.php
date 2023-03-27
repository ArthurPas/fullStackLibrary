<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

/**
 * Category
 *
 * @ORM\Table(name="CATEGORY", uniqueConstraints={@ORM\UniqueConstraint(name="CATEGORY_NAME", columns={"CATEGORY_NAME"})})
 * @ORM\Entity(repositoryClass="App\Repository\CategoryRepository")
 */
class Category
{
    /**
     * @var int
     *
     * @ORM\Column(name="ID_CATEGORY", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idCategory;

    /**
     * @var string
     *
     * @ORM\Column(name="CATEGORY_NAME", type="string", length=255, nullable=false, options={"fixed"=true})
     */
    private $categoryName;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="Book", mappedBy="idCategory")
     */
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
