# /*****************************************
# /*   Naming conventions
# /*****************************************/

module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.1"
  prefix  = ["mod", "test"]
  #suffix = random_string.random.value

  unique-include-numbers = false
  unique-length          = 4
}