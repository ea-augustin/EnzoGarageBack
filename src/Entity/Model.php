<?php

namespace App\Entity;

use App\Repository\ModelRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ModelRepository::class)
 */
class Model
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
    private $name_m;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNameM(): ?string
    {
        return $this->name_m;
    }

    public function setNameM(string $name_m): self
    {
        $this->name_m = $name_m;

        return $this;
    }
}
