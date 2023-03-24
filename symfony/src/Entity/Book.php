<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\JoinColumn;
use App\Repository\BookRepository;
use App\Entity\Author;
use App\Entity\Category;
use App\Entity\Language;
use Doctrine\ORM\Mapping\JoinTable;



#[ORM\Table(name: "BOOK")]
#[ORM\Entity(repositoryClass: BookRepository::class)]
class Book
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(name: "ID_BOOK", type: "bigint", nullable: false)]
    private $idBook;

    #[ORM\Column(name: "TITLE", type: "text", length: 65535, nullable: false)]
    private $title;

    #[ORM\Column(name: "IMAGE", type: "string", length: 255, nullable: true, options: ["fixed" => true])]
    private $image;

    #[ORM\Column(name: "DESCRIPTION", type: "text", length: 65535, nullable: true)]
    private $description;

    #[ORM\Column(name: "NUMBER_OF_PAGES", type: "bigint", nullable: true)]
    private $numberOfPages;

    #[ORM\Column(name: "EDITOR", type: "string", length: 255, nullable: true, options: ["fixed" => true])]
    private $editor;

    #[ORM\ManyToOne(targetEntity: "Language")]
    #[ORM\JoinColumn(name: "ID_LANGUAGE", referencedColumnName: "ID_LANGUAGE")]
    private $idLanguage;

    #[ORM\ManyToMany(targetEntity: "Author", mappedBy: "idBook")]
    private $idAuthor;

    
    #[ORM\ManyToMany(targetEntity: "Category")]
    #[ORM\JoinColumn(name: 'ID_CATEGORY', referencedColumnName: 'ID_CATEGORY')] 
    private $idCategory;

    public function __construct() {
        $this->idAuthor = new ArrayCollection();
        $this->idCategory = new ArrayCollection();
    } 


    public function getIdBook(): ?string
    {
        return $this->idBook;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(?string $image): self
    {
        $this->image = $image;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getNumberOfPages(): ?string
    {
        return $this->numberOfPages;
    }

    public function setNumberOfPages(?string $numberOfPages): self
    {
        $this->numberOfPages = $numberOfPages;

        return $this;
    }

    public function getEditor(): ?string
    {
        return $this->editor;
    }

    public function setEditor(?string $editor): self
    {
        $this->editor = $editor;

        return $this;
    }

    public function getIdLanguage(): ?Language
    {
        return $this->idLanguage;
    }

    public function setIdLanguage(?Language $idLanguage): self
    {
        $this->idLanguage = $idLanguage;

        return $this;
    }

    /**
     * @return Collection<int, Author>
     */
    public function getIdAuthor(): Collection
    {
        return $this->idAuthor;
    }

    public function addIdAuthor(Author $idAuthor): self
    {
        if (!$this->idAuthor->contains($idAuthor)) {
            $this->idAuthor->add($idAuthor);
            $idAuthor->addIdBook($this);
        }

        return $this;
    }

    public function removeIdAuthor(Author $idAuthor): self
    {
        if ($this->idAuthor->removeElement($idAuthor)) {
            $idAuthor->removeIdBook($this);
        }

        return $this;
    }

    /**
     * @return Collection<int, Category>
     */
    public function getIdCategory(): Collection
    {
        return $this->idCategory;
    }

    public function addIdCategory(Category $idCategory): self
    {
        if (!$this->idCategory->contains($idCategory)) {
            $this->idCategory->add($idCategory);
        }

        return $this;
    }

    public function removeIdCategory(Category $idCategory): self
    {
        $this->idCategory->removeElement($idCategory);

        return $this;
    }

}
