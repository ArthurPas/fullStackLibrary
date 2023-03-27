<?php

namespace AppEntity;

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
     * @var string
     *
     * @ORM\Column(name="TITLE", type="text", length=65535, nullable=false)
     */
    private $title;

    /**
     * @var string|null
     *
     * @ORM\Column(name="IMAGE", type="text", length=65535, nullable=true)
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
     * @ORM\Column(name="EDITOR", type="text", length=65535, nullable=true)
     */
    private $editor;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="RELEASE_DATE", type="date", nullable=true)
     */
    private $releaseDate;

    /**
     * @var \Language
     *
     * @ORM\ManyToOne(targetEntity="Language")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="ID_LANGUAGE", referencedColumnName="ID_LANGUAGE")
     * })
     */
    private $idLanguage;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="Author", mappedBy="idBook")
     */
    private $idAuthor = array();

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="User", mappedBy="idBook")
     */
    private $idUser = array();

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="Category", inversedBy="idBook")
     * @ORM\JoinTable(name="tag",
     *   joinColumns={
     *     @ORM\JoinColumn(name="ID_BOOK", referencedColumnName="ID_BOOK")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="ID_CATEGORY", referencedColumnName="ID_CATEGORY")
     *   }
     * )
     */
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

}
