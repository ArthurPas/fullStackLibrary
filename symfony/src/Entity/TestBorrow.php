<?php

namespace App\Entity;

use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

/**
 * TestBorrow
 *
 * @ORM\Table(name="TEST_BORROW", indexes={@ORM\Index(name="TEST_I_FK_test_BORROW_BOOK", columns={"TEST_ID_BOOK"}),
 * @ORM\Index(name="I_FK_test_BORROW_TEST_USER", columns={"ID_TEST_USER"})})
 * @ORM\Entity
 */
class TestBorrow
{
    /**
     * @var int
     *
     * @ORM\Column(name="ID_test_BORROW", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idTestBorrow;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="START_DATE", type="date", nullable=false)
     */
    private $startDate;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="END_DATE", type="date", nullable=true)
     */
    private $endDate;

    /**
     * @var \TestUser
     *
     * @ORM\ManyToOne(targetEntity="TestUser")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="ID_TEST_USER", referencedColumnName="ID_TEST_USER")
     * })
     */
    private $idTestUser;

    /**
     * @var \TestBook
     *
     * @ORM\ManyToOne(targetEntity="TestBook")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="TEST_ID_BOOK", referencedColumnName="TEST_ID_BOOK")
     * })
     */
    private $testIdBook;

    public function getIdTestBorrow(): ?string
    {
        return $this->idTestBorrow;
    }

    public function getStartDate(): ?\DateTimeInterface
    {
        return $this->startDate;
    }

    public function setStartDate(\DateTimeInterface $startDate): self
    {
        $this->startDate = $startDate;

        return $this;
    }

    public function getEndDate(): ?\DateTimeInterface
    {
        return $this->endDate;
    }

    public function setEndDate(?\DateTimeInterface $endDate): self
    {
        $this->endDate = $endDate;

        return $this;
    }

    public function getIdTestUser(): ?TestUser
    {
        return $this->idTestUser;
    }

    public function setIdTestUser(?TestUser $idTestUser): self
    {
        $this->idTestUser = $idTestUser;

        return $this;
    }

    public function getTestIdBook(): ?TestBook
    {
        return $this->testIdBook;
    }

    public function setTestIdBook(?TestBook $testIdBook): self
    {
        $this->testIdBook = $testIdBook;

        return $this;
    }
}
