<?php

namespace AppEntity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Author
 *
 * @ORM\Table(name="AUTHOR")
 * @ORM\Entity
 */
class Author
{
    /**
     * @var int
     *
     * @ORM\Column(name="ID_AUTHOR", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idAuthor;

    /**
     * @var string
     *
     * @ORM\Column(name="AUTHOR_NAME", type="string", length=255, nullable=false, options={"fixed"=true})
     */
    private $authorName;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="Book", inversedBy="idAuthor")
     * @ORM\JoinTable(name="write",
     *   joinColumns={
     *     @ORM\JoinColumn(name="ID_AUTHOR", referencedColumnName="ID_AUTHOR")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="ID_BOOK", referencedColumnName="ID_BOOK")
     *   }
     * )
     */
    private $idBook = array();

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->idBook = new \Doctrine\Common\Collections\ArrayCollection();
    }

}
