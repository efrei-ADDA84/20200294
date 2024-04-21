# Déploiement d'une machine virtuelle Azure avec Terraform

Ce projet vise à déployer une machine virtuelle Azure avec une adresse IP publique dans un réseau existant en utilisant Terraform. En outre, le README présente étape par étape les choix techniques effectués ainsi que les difficultés rencontrées lors du déploiement.

## Prérequis

Assurez-vous d'avoir les éléments suivants avant de commencer :

- Un compte Azure avec les autorisations nécessaires pour créer des ressources.
- Terraform installé sur votre machine locale.

## Configuration

### Fichiers Terraform

Les fichiers de configuration Terraform sont organisés comme suit :

- **`network.tf`**: Ce fichier définit les ressources de réseau, notamment le sous-réseau, l'interface réseau et l'adresse IP publique.
- **`main.tf`**: Ce fichier contient la configuration principale de Terraform, y compris la définition des fournisseurs, des clés SSH et de la machine virtuelle elle-même.

### Variables

Assurez-vous de définir les variables suivantes dans un fichier `terraform.tfvars` ou en passant des valeurs directement via la ligne de commande :

- `subscription_id`: L'ID de l'abonnement Azure.
- D'autres variables peuvent être ajoutées en fonction de vos besoins spécifiques.

## Déploiement

1. Initialisez Terraform :

    ```
    terraform init
    ```

2. Vérifiez le plan d'exécution :

    ```
    terraform plan
    ```

3. Appliquez les changements pour créer les ressources Azure :

    ```
    terraform apply
    ```

4. Suivez les instructions affichées pour valider et appliquer les changements.

## Connexion à la machine virtuelle

Une fois que la machine virtuelle est déployée avec succès, vous pouvez vous connecter à celle-ci à l'aide de SSH en utilisant la clé privée générée par Terraform.