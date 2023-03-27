<?php

namespace AppEntity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Language
 *
 * @ORM\Table(name="LANGUAGE")
 * @ORM\Entity
 */
class Language
{
    /**
     * @var int
     *
     * @ORM\Column(name="ID_LANGUAGE", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idLanguage;

    /**
     * @var string
     *
     * @ORM\Column(name="LIB_LANGUAGE", type="string", length=255, nullable=false, options={"fixed"=true})
     */
    private $libLanguage;


}
