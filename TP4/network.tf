data "azurerm_subnet" "tp4" {
  name                 = "internal"
  virtual_network_name = "network-tp4"
  resource_group_name  = "ADDA84-CTP"
}

resource "azurerm_network_interface" "tp4" {
  name                = "lab4-20200294-nic"
  location            = "francecentral"
  resource_group_name = "ADDA84-CTP"

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id = data.azurerm_subnet.tp4.id
  }
}

resource "azurerm_public_ip" "tp4" {
  name                = "lab4-20200294-ip"
  location            = "francecentral"
  resource_group_name = "ADDA84-CTP"
  allocation_method   = "Static"
}
