<?php

namespace App\Entity;

use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

/**
 * Book
 *
 * @ORM\Table(name="BOOK", indexes={@ORM\Index(name="I_FK_BOOK_LANGUAGE", columns={"ID_LANGUAGE"})})
 * @ORM\Entity
 */
class Book
{
    /**
     * @var int
     *
     * @ORM\Column(name="ID_BOOK", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idBook;

    /**
     * @var int|null
     *
     * @ORM\Column(name="ID_LANGUAGE", type="bigint", nullable=true)
     */
    private $idLanguage;

    /**
     * @var string
     *
     * @ORM\Column(name="TITLE", type="text", length=65535, nullable=false)
     */
    private $title;

    /**
     * @var string|null
     *
     * @ORM\Column(name="IMAGE", type="string", length=255, nullable=true, options={"fixed"=true})
     */
    private $image;

    /**
     * @var string|null
     *
     * @ORM\Column(name="DESCRIPTION", type="text", length=65535, nullable=true)
     */
    private $description;

    /**
     * @var int|null
     *
     * @ORM\Column(name="NUMBER_OF_PAGES", type="bigint", nullable=true)
     */
    private $numberOfPages;

    /**
     * @var string|null
     *
     * @ORM\Column(name="EDITOR", type="string", length=255, nullable=true, options={"fixed"=true})
     */
    private $editor;

    public function getIdBook(): ?string
    {
        return $this->idBook;
    }

    public function getIdLanguage(): ?string
    {
        return $this->idLanguage;
    }

    public function setIdLanguage(?string $idLanguage): self
    {
        $this->idLanguage = $idLanguage;

        return $this;
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

}
