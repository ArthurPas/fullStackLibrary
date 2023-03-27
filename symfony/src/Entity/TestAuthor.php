<?php

namespace AppEntity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TestAuthor
 *
 * @ORM\Table(name="TEST_AUTHOR")
 * @ORM\Entity
 */
class TestAuthor
{
    /**
     * @var int
     *
     * @ORM\Column(name="TEST_ID_AUTHOR", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $testIdAuthor;

    /**
     * @var string
     *
     * @ORM\Column(name="TEST_AUTHOR_NAME", type="string", length=255, nullable=false, options={"fixed"=true})
     */
    private $testAuthorName;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="TestBook", inversedBy="testIdAuthor")
     * @ORM\JoinTable(name="test_write",
     *   joinColumns={
     *     @ORM\JoinColumn(name="TEST_ID_AUTHOR", referencedColumnName="TEST_ID_AUTHOR")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="TEST_ID_BOOK", referencedColumnName="TEST_ID_BOOK")
     *   }
     * )
     */
    private $testIdBook = array();

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->testIdBook = new \Doctrine\Common\Collections\ArrayCollection();
    }

}
