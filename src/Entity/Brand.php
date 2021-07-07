<?php

namespace App\Entity;

use App\Repository\BrandRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=BrandRepository::class)
 */
class Brand
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
    private $name_b;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNameB(): ?string
    {
        return $this->name_b;
    }

    public function setNameB(string $name_b): self
    {
        $this->name_b = $name_b;

        return $this;
    }
}
