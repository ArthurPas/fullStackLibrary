<?php

namespace App\Entity;

use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

/**
 * TestLanguage
 *
 * @ORM\Table(name="TEST_LANGUAGE")
 * @ORM\Entity
 */
class TestLanguage
{
    /**
     * @var int
     *
     * @ORM\Column(name="TEST_ID_LANGUAGE", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $testIdLanguage;

    /**
     * @var string
     *
     * @ORM\Column(name="TEST_LIB_LANGUAGE", type="string", length=255, nullable=false, options={"fixed"=true})
     */
    private $testLibLanguage;

    public function getTestIdLanguage(): ?string
    {
        return $this->testIdLanguage;
    }

    public function getTestLibLanguage(): ?string
    {
        return $this->testLibLanguage;
    }

    public function setTestLibLanguage(string $testLibLanguage): self
    {
        $this->testLibLanguage = $testLibLanguage;

        return $this;
    }


}
