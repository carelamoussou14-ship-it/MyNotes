<<<<<<< HEAD
# MyNotes
<<<<<<< HEAD

Application mobile développée avec Flutter permettant de créer, consulter, modifier et supprimer des notes personnelles.

## Fonctionnalités

- Connexion utilisateur
- Ajout de notes
- Consultation des notes
- Modification des notes
- Suppression des notes
- Stockage local avec SQLite

## Technologies utilisées

- Flutter
- Dart
- SQLite (sqflite)
- Material Design 3

## Structure du projet

```text
lib/
├── database/
│   └── database_helper.dart
├── models/
│   └── note.dart
├── screens/
│   ├── login_screen.dart
│   ├── home_screen.dart
│   └── note_screen.dart
└── main.dart

assets/
└── images/
    ├── logo.jpg
    └── emptymessage.jpg
```

## Installation

1. Cloner le projet :

```bash
git clone https://github.com/carelamoussou14-ship-it/MyNotes.git
```

2. Accéder au dossier :

```bash
cd mynotes
```

3. Installer les dépendances :

```bash
flutter pub get
```

## Démarrage

Vérifier les appareils disponibles :

```bash
flutter devices
```

Lancer l'application :

```bash
flutter run
```

## Base de données

L'application utilise SQLite pour stocker les notes localement.

Table utilisée :

```sql
CREATE TABLE notes(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  titre TEXT NOT NULL,
  contenu TEXT NOT NULL
);
```

## Maquettes

### Écran de connexion

- Logo MyNotes
- Champ utilisateur (admin)
- Champ mot de passe (1234)
- Bouton de connexion

### Écran principal

- Liste des notes enregistrées
- Bouton d'ajout
- Modification et suppression des notes

### Écran vide

- Illustration
- Message indiquant qu'aucune note n'est enregistrée

## Auteur

**AMOUSSOU Carèl Eric Gbènato**

Projet réalisé dans le cadre de l'apprentissage du développement mobile avec DCLIC.
=======
Application mobile développée avec Flutter permettant de créer, consulter, modifier et supprimer des notes personnelles.
>>>>>>> a83300e0722362e534b0297806bcd93fabe5f2eb
=======

>>>>>>> 91108bb8b106b4ae08d6fefb1055092c390b365c
