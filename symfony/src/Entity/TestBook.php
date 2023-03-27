<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
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

    public function getTestIdBook(): ?string
    {
        return $this->testIdBook;
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

    public function getReleaseDate(): ?\DateTimeInterface
    {
        return $this->releaseDate;
    }

    public function setReleaseDate(?\DateTimeInterface $releaseDate): self
    {
        $this->releaseDate = $releaseDate;

        return $this;
    }

    public function getTestIdLanguage(): ?TestLanguage
    {
        return $this->testIdLanguage;
    }

    public function setTestIdLanguage(?TestLanguage $testIdLanguage): self
    {
        $this->testIdLanguage = $testIdLanguage;

        return $this;
    }

    /**
     * @return Collection<int, TestAuthor>
     */
    public function getTestIdAuthor(): Collection
    {
        return $this->testIdAuthor;
    }

    public function addTestIdAuthor(TestAuthor $testIdAuthor): self
    {
        if (!$this->testIdAuthor->contains($testIdAuthor)) {
            $this->testIdAuthor->add($testIdAuthor);
            $testIdAuthor->addTestIdBook($this);
        }

        return $this;
    }

    public function removeTestIdAuthor(TestAuthor $testIdAuthor): self
    {
        if ($this->testIdAuthor->removeElement($testIdAuthor)) {
            $testIdAuthor->removeTestIdBook($this);
        }

        return $this;
    }

    /**
     * @return Collection<int, TestCategory>
     */
    public function getTestIdCategory(): Collection
    {
        return $this->testIdCategory;
    }

    public function addTestIdCategory(TestCategory $testIdCategory): self
    {
        if (!$this->testIdCategory->contains($testIdCategory)) {
            $this->testIdCategory->add($testIdCategory);
        }

        return $this;
    }

    public function removeTestIdCategory(TestCategory $testIdCategory): self
    {
        $this->testIdCategory->removeElement($testIdCategory);

        return $this;
    }

    /**
     * @return Collection<int, TestUser>
     */
    public function getIdTestUser(): Collection
    {
        return $this->idTestUser;
    }

    public function addIdTestUser(TestUser $idTestUser): self
    {
        if (!$this->idTestUser->contains($idTestUser)) {
            $this->idTestUser->add($idTestUser);
            $idTestUser->addTestIdBook($this);
        }

        return $this;
    }

    public function removeIdTestUser(TestUser $idTestUser): self
    {
        if ($this->idTestUser->removeElement($idTestUser)) {
            $idTestUser->removeTestIdBook($this);
        }

        return $this;
    }

}
