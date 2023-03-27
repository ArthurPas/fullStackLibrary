<?php

namespace AppEntity;

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

}
