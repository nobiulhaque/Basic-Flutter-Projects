import 'package:flutter/material.dart';
import 'package:notes_app/database/noates_database.dart';

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
        onPressed: () {},
        backgroundColor: Colors.white,
        child: const Icon(Icons.add,
        color: Colors.black87, 
        size: 30),
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisExtent: 16,
                  childAspectRatio: 0.85,
                ),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];

                  return Text(note['title']);
                },
              ),
            ),
    );
  }
}
