<?php

namespace App\Entity;

use App\Repository\GarageRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=GarageRepository::class)
 */
class Garage
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
    private $name_g;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $street_num_g;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $postal_code_g;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $email_g;

    /**
     * @ORM\Column(type="integer")
     */
    private $tel_g;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNameG(): ?string
    {
        return $this->name_g;
    }

    public function setNameG(string $name_g): self
    {
        $this->name_g = $name_g;

        return $this;
    }

    public function getStreetNumG(): ?string
    {
        return $this->street_num_g;
    }

    public function setStreetNumG(string $street_num_g): self
    {
        $this->street_num_g = $street_num_g;

        return $this;
    }

    public function getPostalCodeG(): ?string
    {
        return $this->postal_code_g;
    }

    public function setPostalCodeG(string $postal_code_g): self
    {
        $this->postal_code_g = $postal_code_g;

        return $this;
    }

    public function getEmailG(): ?string
    {
        return $this->email_g;
    }

    public function setEmailG(string $email_g): self
    {
        $this->email_g = $email_g;

        return $this;
    }

    public function getTelG(): ?int
    {
        return $this->tel_g;
    }

    public function setTelG(int $tel_g): self
    {
        $this->tel_g = $tel_g;

        return $this;
    }
}
