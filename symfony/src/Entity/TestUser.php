<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
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

    public function getIdTestUser(): ?string
    {
        return $this->idTestUser;
    }

    public function getFirstname(): ?string
    {
        return $this->firstname;
    }

    public function setFirstname(string $firstname): self
    {
        $this->firstname = $firstname;

        return $this;
    }

    public function getLastname(): ?string
    {
        return $this->lastname;
    }

    public function setLastname(string $lastname): self
    {
        $this->lastname = $lastname;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    public function getAvatar(): ?string
    {
        return $this->avatar;
    }

    public function setAvatar(string $avatar): self
    {
        $this->avatar = $avatar;

        return $this;
    }

    public function getToken(): ?string
    {
        return $this->token;
    }

    public function setToken(?string $token): self
    {
        $this->token = $token;

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
        }

        return $this;
    }

    public function removeTestIdBook(TestBook $testIdBook): self
    {
        $this->testIdBook->removeElement($testIdBook);

        return $this;
    }

    /**
     * @return Collection<int, TestUser>
     */
    public function getTestIdTestUserIsFollowed(): Collection
    {
        return $this->testIdTestUserIsFollowed;
    }

    public function addTestIdTestUserIsFollowed(TestUser $testIdTestUserIsFollowed): self
    {
        if (!$this->testIdTestUserIsFollowed->contains($testIdTestUserIsFollowed)) {
            $this->testIdTestUserIsFollowed->add($testIdTestUserIsFollowed);
        }

        return $this;
    }

    public function removeTestIdTestUserIsFollowed(TestUser $testIdTestUserIsFollowed): self
    {
        $this->testIdTestUserIsFollowed->removeElement($testIdTestUserIsFollowed);

        return $this;
    }
}
