import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class NoteScreen extends StatefulWidget {
  final Map<String, dynamic>? note;

  const NoteScreen({
    super.key,
    this.note,
  });

  @override
  State<NoteScreen> createState() =>
      _NoteScreenState();
}

class _NoteScreenState
    extends State<NoteScreen> {
  final TextEditingController titreController =
      TextEditingController();

  final TextEditingController contenuController =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.note != null) {
      titreController.text =
          widget.note!['titre'];

      contenuController.text =
          widget.note!['contenu'];
    }
  }

  Future<void> enregistrer() async {
    if (titreController.text.isEmpty ||
        contenuController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "Veuillez remplir tous les champs",
          ),
        ),
      );
      return;
    }

    if (widget.note == null) {
      await DatabaseHelper.instance
          .insertNote({
        'titre': titreController.text,
        'contenu': contenuController.text,
      });
    } else {
      await DatabaseHelper.instance
          .updateNote(
        widget.note!['id'],
        {
          'titre': titreController.text,
          'contenu': contenuController.text,
        },
      );
    }

    if (!mounted) return;

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.note == null
              ? 'Nouvelle Note'
              : 'Modifier la Note',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titreController,
              decoration:
                  const InputDecoration(
                labelText: 'Titre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: contenuController,
              maxLines: 5,
              decoration:
                  const InputDecoration(
                labelText: 'Contenu',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: enregistrer,
                child: Text(
                  widget.note == null
                      ? 'Enregistrer'
                      : 'Mettre à jour',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}