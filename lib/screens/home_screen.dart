import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import 'note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> notes = [];

  @override
  void initState() {
    super.initState();
    chargerNotes();
  }

  Future<void> chargerNotes() async {
    final data = await DatabaseHelper.instance.getNotes();

    setState(() {
      notes = data;
    });
  }

  Future<void> supprimerNote(int id) async {
    await DatabaseHelper.instance.deleteNote(id);

    chargerNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Notes'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.note_alt),
          ),
        ],
      ),

      body: notes.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.note_alt_outlined,
                    size: 100,
                    color: Colors.blue,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Aucune note enregistrée",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Padding(
                    padding:
                        EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Text(
                      "Appuyez sur le bouton ci-dessous pour créer votre première note.",
                      textAlign:
                          TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding:
                  const EdgeInsets.all(10),
              itemCount: notes.length,
              itemBuilder:
                  (context, index) {
                return Card(
                  elevation: 4,
                  margin:
                      const EdgeInsets.only(
                    bottom: 10,
                  ),
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                      15,
                    ),
                  ),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.all(
                      12,
                    ),

                    leading:
                        const CircleAvatar(
                      child: Icon(
                        Icons.note,
                      ),
                    ),

                    title: Text(
                      notes[index]['titre'],
                      style:
                          const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    subtitle: Padding(
                      padding:
                          const EdgeInsets.only(
                        top: 5,
                      ),
                      child: Text(
                        notes[index]
                            ['contenu'],
                      ),
                    ),

                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        showDialog(
                          context:
                              context,
                          builder:
                              (context) =>
                                  AlertDialog(
                            title:
                                const Text(
                              "Suppression",
                            ),
                            content:
                                const Text(
                              "Voulez-vous supprimer cette note ?",
                            ),
                            actions: [
                              TextButton(
                                onPressed:
                                    () {
                                  Navigator.pop(
                                      context);
                                },
                                child:
                                    const Text(
                                  "Annuler",
                                ),
                              ),
                              TextButton(
                                onPressed:
                                    () {
                                  Navigator.pop(
                                      context);

                                  supprimerNote(
                                    notes[index]
                                        ['id'],
                                  );
                                },
                                child:
                                    const Text(
                                  "Supprimer",
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),

      floatingActionButton:
          FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text(
          "Nouvelle note",
        ),
        onPressed: () async {
          final resultat =
              await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const NoteScreen(),
            ),
          );

          if (resultat == true) {
            chargerNotes();
          }
        },
      ),
    );
  }
}