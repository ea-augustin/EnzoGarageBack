<?php

namespace App\Entity;

use App\Repository\FueltypeRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=FueltypeRepository::class)
 */
class Fueltype
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $type_fuel;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTypeFuel(): ?string
    {
        return $this->type_fuel;
    }

    public function setTypeFuel(string $type_fuel): self
    {
        $this->type_fuel = $type_fuel;

        return $this;
    }
}
