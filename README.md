# Projet d'Automatisation : Infrastructure-as-Code & Configuration Management

Ce projet permet de déployer une infrastructure complète (Base de données PostgreSQL et Application Python) sur un environnement Proxmox de manière totalement automatisée. Il illustre l'interopérabilité entre Terraform pour le provisioning et Ansible pour la configuration logicielle.

## Architecture & Fonctionnement

L'orchestration est pilotée par Terraform et suit ce cycle de vie :

- Provisioning (Terraform) : Déploiement des VM sur Proxmox.

- Inventaire Dynamique : Génération automatique du fichier inventory.ini dans le dossier Ansible avec les adresses IP récupérées en temps réel.

- Contrôle de Connectivité : Terraform teste la disponibilité du port SSH (22) avant de passer la main à Ansible.

- Configuration (Ansible) : Exécution du playbook pour installer et démarrer les services.

## Prérequis & Dépendances

### Versions logicielles validées

- Terraform : `v1.14.6`

- Ansible : `2.20.3`

- Netcat (nc) : Utilisé pour les tests de connectivité réseau dans le script de déploiement.

### Environnement Python & Ansible

Si Ansible est installé dans un environnement virtuel (Conda ou Venv), vous devez impérativement activer votre environnement (ex: `conda activate mon_env`) dans votre terminal avant de lancer les commandes Terraform. Le processus `local-exec` de Terraform héritera des variables d'environnement du shell courant pour localiser le binaire `ansible-playbook`.

## Personnalisation de la Configuration

### Variables Terraform (terraform.tfvars)

Toutes les variables relatives à l'infrastructure sont centralisées dans un seul fichier.

Renommez le fichier `terraform.tfvars.example` en `terraform.tfvars`.

Complétez l'intégralité des champs. Ce fichier contient toutes les données nécessaires au bon fonctionnement des modules.

### Variables Ansible

Général : Modifiez `ansible/group_vars/all/servers.yml` pour les paramètres communs.

Rôles : Les valeurs par défaut se trouvent dans `ansible/roles/<role_name>/defaults/main.yml`.

Dépendances App : Le fichier `ansible/roles/app/files/requirements.txt` liste les librairies Python à installer sur la VM cible.

### Sécurité & Ansible Vault

Le projet utilise un coffre-fort pour protéger les données sensibles (mots de passe BDD).

Dans le répertoire `ansible/`, renommez le fichier `.vault_pass.example` en `.vault_pass`.

Remplacez le mot de passe par défaut (incorrect) par votre véritable mot de passe de coffre-fort.

Le playbook utilise ce fichier pour déchiffrer `ansible/group_vars/all/vault.yml`.

### Modification des secrets (Ansible Vault)

Le fichier `vault.yml` étant chiffré, il ne peut être modifié directement. Pour éditer une variable :

Placez-vous dans le répertoire `ansible/`.

Exécutez :

```bash
ansible-vault edit group_vars/all/vault.yml --vault-password-file .vault_pass
```

L'éditeur s'ouvre, modifiez vos données, puis sauvegardez. Le fichier sera rechiffré automatiquement.

## Procédure de Lancement

Toutes les commandes Terraform doivent être exécutées depuis le répertoire `/terraform`.

Accéder au répertoire racine du projet Terraform:

```bash
cd terraform/
```

Initialiser le projet et télécharger les providers (dont le provider 'null'):

```bash
terraform init
```

Lancer le déploiement complet:

```bash
terraform apply
```

## Focus Technique : Le "Bridge" Terraform-Ansible

La communication entre les deux outils repose sur une ressource `null_resource` nommée `run_ansible`.

### Gestion des Triggers

Le script Ansible ne se lance que si :

- Le fichier d'inventaire a été généré avec succès.

- Les IDs des machines virtuelles ont changé (déclenchement automatique en cas de recréation d'une VM).

### Attente active du SSH

Pour éviter que Ansible n'échoue si la VM n'a pas fini de booter, Terraform exécute une boucle until utilisant `nc -z`. Cela garantit que le service SSH est prêt avant l'exécution du Playbook.

### Visibilité des logs

Les variables sensibles étant passées au `local-exec` via la fonction `nonsensitive()`, les logs d'Ansible et les messages de debug sont affichés en temps réel dans la console Terraform, facilitant le suivi du déploiement.

## Vérification du déploiement

Une fois l'infrastructure déployée et configurée, le succès est vérifiable par trois éléments :

### Outputs Terraform

À la fin de l'exécution, la console affichera automatiquement les variables d'outputs (IPs, noms des VMs, RAM, etc.) pour confirmer la bonne création des ressources.

### Résultat de la requête API (Ansible)

Une tâche de test est intégrée à la fin du rôle app. Elle effectue une requête locale sur l'API et affiche le résultat dans la console. Vous devez voir apparaître :

```
"msg": "hello <NOM>"
```

> NOM correspond à la variable `my_name` définie dans`ansible/group_vars/all/servers.yml`

### Test Navigateur

Ouvrez votre navigateur et rendez-vous à l'adresse suivante (en remplaçant par l'IP et le port de votre VM application) :

```
http://<IP_APP>:<PORT_APP>
```

La page doit afficher : `hello <NOM>`

### État du service

Le service système est géré par `Systemd`. Son nom est défini par la variable `service_name` dans le rôle app. Pour vérifier son état :

```bash
systemctl status <service_name>
```
