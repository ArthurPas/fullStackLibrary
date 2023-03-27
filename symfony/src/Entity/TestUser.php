<?php

namespace AppEntity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TestUser
 *
 * @ORM\Table(name="TEST_USER")
 * @ORM\Entity
 */
class TestUser
{
    /**
     * @var int
     *
     * @ORM\Column(name="ID_TEST_USER", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idTestUser;

    /**
     * @var string
     *
     * @ORM\Column(name="FIRSTNAME", type="string", length=255, nullable=false, options={"fixed"=true})
     */
    private $firstname;

    /**
     * @var string
     *
     * @ORM\Column(name="LASTNAME", type="string", length=255, nullable=false, options={"fixed"=true})
     */
    private $lastname;

    /**
     * @var string
     *
     * @ORM\Column(name="EMAIL", type="string", length=255, nullable=false, options={"fixed"=true})
     */
    private $email;

    /**
     * @var string
     *
     * @ORM\Column(name="PASSWORD", type="string", length=255, nullable=false, options={"fixed"=true})
     */
    private $password;

    /**
     * @var string
     *
     * @ORM\Column(name="AVATAR", type="text", length=65535, nullable=false)
     */
    private $avatar;

    /**
     * @var string|null
     *
     * @ORM\Column(name="TOKEN", type="text", length=65535, nullable=true)
     */
    private $token;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="TestBook", inversedBy="idTestUser")
     * @ORM\JoinTable(name="test_rating",
     *   joinColumns={
     *     @ORM\JoinColumn(name="ID_TEST_USER", referencedColumnName="ID_TEST_USER")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="TEST_ID_BOOK", referencedColumnName="TEST_ID_BOOK")
     *   }
     * )
     */
    private $testIdBook = array();

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="TestUser", inversedBy="testIdTestUserFollow")
     * @ORM\JoinTable(name="test_follow",
     *   joinColumns={
     *     @ORM\JoinColumn(name="TEST_ID_TEST_USER_FOLLOW", referencedColumnName="ID_TEST_USER")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="TEST_ID_TEST_USER_IS_FOLLOWED", referencedColumnName="ID_TEST_USER")
     *   }
     * )
     */
    private $testIdTestUserIsFollowed = array();

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->testIdBook = new \Doctrine\Common\Collections\ArrayCollection();
        $this->testIdTestUserIsFollowed = new \Doctrine\Common\Collections\ArrayCollection();
    }

}
