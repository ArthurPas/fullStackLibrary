<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\Collection;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * Author
 *
 * @ORM\Table(name="AUTHOR")
 * @ORM\Entity(repositoryClass="App\Repository\AuthorRepository")
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
     * @var string
     *
     * @ORM\Column(name="AUTHOR_NAME", type="string", length=255, nullable=false,
     * options={"fixed"=true})
     */
    #[Groups(['AuthorName'])]
    private $authorName;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="Book", inversedBy="idAuthor")
     * @ORM\JoinTable(name="WWRITE",
     *   joinColumns={
     *     @ORM\JoinColumn(name="ID_AUTHOR", referencedColumnName="ID_AUTHOR")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="ID_BOOK", referencedColumnName="ID_BOOK")
     *   }
     * )
     */
    private $idBook = array();

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->idBook = new \Doctrine\Common\Collections\ArrayCollection();
    }

    public function getIdAuthor(): ?string
    {
        return $this->idAuthor;
    }

    public function getAuthorName(): ?string
    {
        return $this->authorName;
    }

    public function setAuthorName(string $authorName): self
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
