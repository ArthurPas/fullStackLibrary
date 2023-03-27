<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

/**
 * TestCategory
 *
 * @ORM\Table(name="TEST_CATEGORY")
 * @ORM\Entity
 */
class TestCategory
{
    /**
     * @var int
     *
     * @ORM\Column(name="TEST_ID_CATEGORY", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $testIdCategory;

    /**
     * @var string
     *
     * @ORM\Column(name="TEST_CATEGORY_NAME", type="string", length=255, nullable=false, options={"fixed"=true})
     */
    private $testCategoryName;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="TestBook", mappedBy="testIdCategory")
     */
    private $testIdBook = array();

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->testIdBook = new \Doctrine\Common\Collections\ArrayCollection();
    }

    public function getTestIdCategory(): ?string
    {
        return $this->testIdCategory;
    }

    public function getTestCategoryName(): ?string
    {
        return $this->testCategoryName;
    }

    public function setTestCategoryName(string $testCategoryName): self
    {
        $this->testCategoryName = $testCategoryName;

        return $this;
    }

    /**
     * @return Collection<int, TestBook>
     */
    public function getTestIdBook(): Collection
    {
        return $this->testIdBook;
    }

    public function addTestIdBook(TestBook $testIdBook): self
    {
        if (!$this->testIdBook->contains($testIdBook)) {
            $this->testIdBook->add($testIdBook);
            $testIdBook->addTestIdCategory($this);
        }

        return $this;
    }

    public function removeTestIdBook(TestBook $testIdBook): self
    {
        if ($this->testIdBook->removeElement($testIdBook)) {
            $testIdBook->removeTestIdCategory($this);
        }

        return $this;
    }

}
