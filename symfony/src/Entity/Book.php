<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * Book
 *
 * @ORM\Table(name="BOOK", indexes={@ORM\Index(name="I_FK_BOOK_LANGUAGE",
 * columns={"ID_LANGUAGE"})})
 * @ORM\Entity(repositoryClass="App\Repository\BookRepository")
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
     * @var string
     *
     * @ORM\Column(name="TITLE", type="text", length=65535, nullable=false)
     */
    #[Groups(['Books'])]
    private $title;

    /**
     * @var string|null
     *
     * @ORM\Column(name="IMAGE", type="text", length=65535, nullable=true)
     */
    #[Groups(['Books'])]
    private $image;

    /**
     * @var string|null
     *
     * @ORM\Column(name="DESCRIPTION", type="text", length=65535, nullable=true)
     */
    #[Groups(['Books'])]
    private $description;

    /**
     * @var int|null
     *
     * @ORM\Column(name="NUMBER_OF_PAGES", type="bigint", nullable=true)
     */
    #[Groups(['Books'])]
    private $numberOfPages;

    /**
     * @var string|null
     *
     * @ORM\Column(name="EDITOR", type="text", length=65535, nullable=true)
     */
    #[Groups(['Books'])]
    private $editor;

    /**
     * @var \string|null
     *
     * @ORM\Column(name="RELEASE_DATE", type="string", length=100, nullable=true)
     */
    #[Groups(['Books'])]
    private $releaseDate;

    /**
     * @var \Language
     *
     * @ORM\ManyToOne(targetEntity="Language")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="ID_LANGUAGE", referencedColumnName="ID_LANGUAGE")
     * })
     */
    #[Groups(['Books'])]
    private $idLanguage;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="Author", mappedBy="idBook")
     */
    #[Groups(['Books'])]
    private $idAuthor = array();

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="User", mappedBy="idBook")
     */
    #[Groups(['Books'])]
    private $idUser = array();

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="Category", inversedBy="idBook")
     * @ORM\JoinTable(name="TAG",
     *   joinColumns={
     *     @ORM\JoinColumn(name="ID_BOOK", referencedColumnName="ID_BOOK")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="ID_CATEGORY", referencedColumnName="ID_CATEGORY")
     *   }
     * )
     */
    #[Groups(['Books'])]
    private $idCategory = array();

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->idAuthor = new \Doctrine\Common\Collections\ArrayCollection();
        $this->idUser = new \Doctrine\Common\Collections\ArrayCollection();
        $this->idCategory = new \Doctrine\Common\Collections\ArrayCollection();
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

    public function getReleaseDate(): ?string
    {
        return $this->releaseDate;
    }

    public function setReleaseDate(?string $releaseDate): self
    {
        $this->releaseDate = $releaseDate;

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
     * @return Collection<int, User>
     */
    public function getIdUser(): Collection
    {
        return $this->idUser;
    }

    public function addIdUser(User $idUser): self
    {
        if (!$this->idUser->contains($idUser)) {
            $this->idUser->add($idUser);
            $idUser->addIdBook($this);
        }

        return $this;
    }

    public function removeIdUser(User $idUser): self
    {
        if ($this->idUser->removeElement($idUser)) {
            $idUser->removeIdBook($this);
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
