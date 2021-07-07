<?php

namespace App\Entity;

use App\Repository\CityRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=CityRepository::class)
 */
class City
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=250)
     */
    private $name_c;

    /**
     * @ORM\Column(type="string", length=250)
     */
    private $region;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNameC(): ?string
    {
        return $this->name_c;
    }

    public function setNameC(string $name_c): self
    {
        $this->name_c = $name_c;

        return $this;
    }

    public function getRegion(): ?string
    {
        return $this->region;
    }

    public function setRegion(string $region): self
    {
        $this->region = $region;

        return $this;
    }
}
