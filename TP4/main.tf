terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
}

provider "azurerm" {
  subscription_id             = "765266c6-9a23-4638-af32-dd1e32613047"
  features                    {}
  skip_provider_registration = true
}


resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_linux_virtual_machine" "tp4" {
  name                = "devops-20200294"
  resource_group_name = "ADDA84-CTP"  # Référence au groupe de ressources existant
  location            = "francecentral"  # Localisation du groupe de ressources existant
  size                = "Standard_D2s_v3"
  admin_username      = "devops"
  
  admin_ssh_key {
    username   = "devops"
    public_key = tls_private_key.ssh_key.public_key_openssh
  }
  network_interface_ids = [azurerm_network_interface.tp4.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }
   source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
}


resource "local_file" "private_key" {
  content     = tls_private_key.ssh_key.private_key_pem
  filename    = ".ssh/terraform_private_key"  # Chemin et nom de fichier pour enregistrer la clé privée
}

output "public_key" {
  value = tls_private_key.ssh_key.public_key_openssh
}

