<?php

namespace App\Entity;

use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

/**
 * Category
 *
 * @ORM\Table(name="CATEGORY")
 * @ORM\Entity
 */
class Category
{
    /**
     * @var int
     *
     * @ORM\Column(name="ID_CATEGORY", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idCategory;

    /**
     * @var string
     *
     * @ORM\Column(name="CATEGORY_NAME", type="string", length=255, nullable=false, options={"fixed"=true})
     */
    private $categoryName;

    public function getIdCategory(): ?string
    {
        return $this->idCategory;
    }

    public function getCategoryName(): ?string
    {
        return $this->categoryName;
    }

    public function setCategoryName(string $categoryName): self
    {
        $this->categoryName = $categoryName;

        return $this;
    }
    
}
