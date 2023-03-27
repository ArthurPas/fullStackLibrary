<?php

namespace AppEntity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TestBook
 *
 * @ORM\Table(name="TEST_BOOK", indexes={@ORM\Index(name="TEST_TEST_I_FK_BOOK_LANGUAGE", columns={"TEST_ID_LANGUAGE"})})
 * @ORM\Entity
 */
class TestBook
{
    /**
     * @var int
     *
     * @ORM\Column(name="TEST_ID_BOOK", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $testIdBook;

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
     * @var \TestLanguage
     *
     * @ORM\ManyToOne(targetEntity="TestLanguage")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="TEST_ID_LANGUAGE", referencedColumnName="TEST_ID_LANGUAGE")
     * })
     */
    private $testIdLanguage;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="TestAuthor", mappedBy="testIdBook")
     */
    private $testIdAuthor = array();

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="TestCategory", inversedBy="testIdBook")
     * @ORM\JoinTable(name="test_tag",
     *   joinColumns={
     *     @ORM\JoinColumn(name="TEST_ID_BOOK", referencedColumnName="TEST_ID_BOOK")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="TEST_ID_CATEGORY", referencedColumnName="TEST_ID_CATEGORY")
     *   }
     * )
     */
    private $testIdCategory = array();

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="TestUser", mappedBy="testIdBook")
     */
    private $idTestUser = array();

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->testIdAuthor = new \Doctrine\Common\Collections\ArrayCollection();
        $this->testIdCategory = new \Doctrine\Common\Collections\ArrayCollection();
        $this->idTestUser = new \Doctrine\Common\Collections\ArrayCollection();
    }

}
