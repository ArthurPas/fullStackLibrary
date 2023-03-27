<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

/**
 * User
 *
 * @ORM\Table(name="USER")
 * @ORM\Entity(repositoryClass="App\Repository\UserRepository")
 */
class User
{
    /**
     * @var int
     *
     * @ORM\Column(name="ID_USER", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idUser;

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
     * @ORM\ManyToMany(targetEntity="Book", inversedBy="idUser")
     * @ORM\JoinTable(name="rating",
     *   joinColumns={
     *     @ORM\JoinColumn(name="ID_USER", referencedColumnName="ID_USER")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="ID_BOOK", referencedColumnName="ID_BOOK")
     *   }
     * )
     */
    private $idBook = array();

        /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="User", inversedBy="idUserFollow")
     * @ORM\JoinTable(name="FOLLOW",
     *   joinColumns={
     *     @ORM\JoinColumn(name="ID_USER_FOLLOW", referencedColumnName="ID_USER")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="ID_USER_IS_FOLLOWED", referencedColumnName="ID_USER")
     *   }
     * )
     */
    private $idUserIsFollowed = array();


    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="User", mappedBy="idUserIsFollowed")
     * @ORM\JoinTable(name="FOLLOW",
     *  joinColumns={
     *    @ORM\JoinColumn(name="ID_USER_IS_FOLLOWED", referencedColumnName="ID_USER")
     * },
     * inverseJoinColumns={
     *   @ORM\JoinColumn(name="ID_USER_FOLLOW", referencedColumnName="ID_USER")
     * }
     * )
     */
    private $idUserFollow = array();

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->idBook = new \Doctrine\Common\Collections\ArrayCollection();
        $this->idUserFollow = new \Doctrine\Common\Collections\ArrayCollection();
        $this->idUserIsFollowed = new ArrayCollection();
    }

    public function getIdUser(): ?string
    {
        return $this->idUser;
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

    /**
     * @return Collection<int, User>
     */
    public function getIdUserFollow(): Collection
    {
        return $this->idUserFollow;
    }

    public function addIdUserFollow(User $idUserFollow): self
    {
        if (!$this->idUserFollow->contains($idUserFollow)) {
            $this->idUserFollow->add($idUserFollow);
            $idUserFollow->addIdUserIsFollowed($this);
        }

        return $this;
    }

    public function removeIdUserFollow(User $idUserFollow): self
    {
        if ($this->idUserFollow->removeElement($idUserFollow)) {
            $idUserFollow->removeIdUserIsFollowed($this);
        }

        return $this;
    }

    public function addIdUserIsFollowed(User $idUserIsFollowed): self
    {
        if (!$this->idUserIsFollowed->contains($idUserIsFollowed)) {
            $this->idUserIsFollowed[] = $idUserIsFollowed;
            $idUserIsFollowed->addIdUserFollow($this);
        }

        return $this;
    }

    public function removeIdUserIsFollowed(User $idUserIsFollowed): self
    {
        if ($this->idUserIsFollowed->removeElement($idUserIsFollowed)) {
            $idUserIsFollowed->removeIdUserFollow($this);
        }

        return $this;
    }

    /**
     * @return Collection<int, User>
     */
    public function getIdUserIsFollowed(): Collection
    {
        return $this->idUserIsFollowed;
    }
}
