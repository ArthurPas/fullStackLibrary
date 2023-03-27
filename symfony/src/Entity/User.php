<?php

namespace AppEntity;

use Doctrine\ORM\Mapping as ORM;

/**
 * User
 *
 * @ORM\Table(name="USER")
 * @ORM\Entity
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
     * @ORM\JoinTable(name="follow",
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
     * Constructor
     */
    public function __construct()
    {
        $this->idBook = new \Doctrine\Common\Collections\ArrayCollection();
        $this->idUserIsFollowed = new \Doctrine\Common\Collections\ArrayCollection();
    }

}
