class Note {
  int? id;
  String titre;
  String contenu;

  Note({
    this.id,
    required this.titre,
    required this.contenu,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titre': titre,
      'contenu': contenu,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      titre: map['titre'],
      contenu: map['contenu'],
    );
  }
}