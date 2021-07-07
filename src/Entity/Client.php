<?php

namespace App\Entity;

use App\Repository\ClientRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ClientRepository::class)
 */
class Client
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
    private $firstname_cl;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $lastname_cl;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $email_cl;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $street_num_cl;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $postal_code_cl;

    /**
     * @ORM\Column(type="integer")
     */
    private $tel_cl;

    /**
     * @ORM\Column(type="bigint")
     */
    private $siren_cl;

    /**
     * @ORM\Column(type="boolean")
     */
    private $status;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFirstnameCl(): ?string
    {
        return $this->firstname_cl;
    }

    public function setFirstnameCl(string $firstname_cl): self
    {
        $this->firstname_cl = $firstname_cl;

        return $this;
    }

    public function getLastnameCl(): ?string
    {
        return $this->lastname_cl;
    }

    public function setLastnameCl(string $lastname_cl): self
    {
        $this->lastname_cl = $lastname_cl;

        return $this;
    }

    public function getEmailCl(): ?string
    {
        return $this->email_cl;
    }

    public function setEmailCl(string $email_cl): self
    {
        $this->email_cl = $email_cl;

        return $this;
    }

    public function getStreetNumCl(): ?string
    {
        return $this->street_num_cl;
    }

    public function setStreetNumCl(string $street_num_cl): self
    {
        $this->street_num_cl = $street_num_cl;

        return $this;
    }

    public function getPostalCodeCl(): ?string
    {
        return $this->postal_code_cl;
    }

    public function setPostalCodeCl(string $postal_code_cl): self
    {
        $this->postal_code_cl = $postal_code_cl;

        return $this;
    }

    public function getTelCl(): ?int
    {
        return $this->tel_cl;
    }

    public function setTelCl(int $tel_cl): self
    {
        $this->tel_cl = $tel_cl;

        return $this;
    }

    public function getSirenCl(): ?string
    {
        return $this->siren_cl;
    }

    public function setSirenCl(string $siren_cl): self
    {
        $this->siren_cl = $siren_cl;

        return $this;
    }

    public function getStatus(): ?bool
    {
        return $this->status;
    }

    public function setStatus(bool $status): self
    {
        $this->status = $status;

        return $this;
    }
}
