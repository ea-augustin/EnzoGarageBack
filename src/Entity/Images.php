<?php

namespace App\Entity;

use App\Repository\ImagesRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ImagesRepository::class)
 */
class Images
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $img_link;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $img_description;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getImgLink(): ?string
    {
        return $this->img_link;
    }

    public function setImgLink(string $img_link): self
    {
        $this->img_link = $img_link;

        return $this;
    }

    public function getImgDescription(): ?string
    {
        return $this->img_description;
    }

    public function setImgDescription(string $img_description): self
    {
        $this->img_description = $img_description;

        return $this;
    }
}
