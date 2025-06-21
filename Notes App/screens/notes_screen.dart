import 'package:flutter/material.dart';
import 'package:notes_app/database/noates_database.dart';
import 'package:notes_app/screens/note_card.dart';
import 'package:notes_app/screens/note_dialog.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Map<String, dynamic>> notes = [];

  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    final fetchedNotes = await NoatesDatabase.instance.getNotes();

    setState(() {
      notes = fetchedNotes;
    });
  }

  final List<int> notecolors = [
    0xFFB9FBC0, // Green
    0xFFFFF3B0, // Yellow
    0xFFFFC3A0, // Orange
    0xFFB28DFF, // Purple
    0xFFB9FBC0, // Light Green
    0xFFB2E4FF, // Light Blue
    0xFFFFB2B2, // Light Red
  ];

  void showNoteDialog({
    int? id,
    String? title,
    String? content,
    int colorIndex = 0,
  }) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return NoteDialog(
          colorIndex: colorIndex,
          notecolors: notecolors,
          noteId: id,
          title: title,
          content: content,
          onNoteSaved:
              (
                newTitle,
                newDescription,
                selectedColorIndex,
                currentDate,
              ) async {
                if (id == null) {
                  await NoatesDatabase.instance.addNote(
                    newTitle,
                    newDescription,
                    currentDate,
                    selectedColorIndex,
                  );
                } else {
                  await NoatesDatabase.instance.updateNote(
                    newTitle,
                    newDescription,
                    currentDate,
                    selectedColorIndex,
                    id,
                  );
                }
                await fetchNotes(); // Refresh notes after save
                Navigator.of(dialogContext).pop(); // Close dialog after save
              },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(176, 12, 64, 143),
        elevation: 0,
        title: const Text(
          'Notes',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // await NoatesDatabase.instance.addNote(
          //   'Sample Title',
          //   'Sample Description',
          //   DateTime.now().toIso8601String(),
          //   0, // Default color index
          // );
          showNoteDialog();
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: Colors.black87, size: 30),
      ),
      body: notes.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.note_add_outlined,
                    size: 80,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'No notes available',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16, // Added for vertical spacing
                  childAspectRatio:
                      0.85, // This is sufficient to control the height
                ),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return NoteCard(
                    note: note,
                    ontap: (id, title, description, colorIndex) {
                      showNoteDialog(
                        id: id,
                        title: title,
                        content: description,
                        colorIndex: colorIndex,
                      );
                    },
                    onDelete: () async {
                      await NoatesDatabase.instance.deleteNote(note['id']);
                      await fetchNotes();
                    },
                    notecolors: notecolors,
                  );
                },
              ),
            ),
    );
  }
}
