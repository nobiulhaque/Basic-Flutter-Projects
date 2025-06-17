import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteDialog extends StatefulWidget {
  final int? noteId;
  final String? title;
  final String? content;
  final int colorIndex;
  final List<int> notecolors;
  final Function onNoteSaved;

  const NoteDialog({
    super.key,
    this.noteId,
    this.title,
    this.content,
    required this.colorIndex,
    required this.notecolors,
    required this.onNoteSaved,
  });

  @override
  State<NoteDialog> createState() => _NoteDialogState();
}

class _NoteDialogState extends State<NoteDialog> {
  late int _selectedColorIndex;

  @override
  Widget build(BuildContext context) {

    final titleController = TextEditingController(text: widget.title);
    final descriptionController = TextEditingController(text: widget.content);
    final currentDate = DateFormat('dd MMMM yyyy').format(DateTime.now());

    return AlertDialog(
      backgroundColor: Color(widget.notecolors[_selectedColorIndex]),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        widget.noteId == null ? 'Add Note' : 'Edit Note',
        style: const TextStyle(color: Colors.black87),
      ),

      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentDate,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withAlpha((0.5 * 255).toInt()),
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  )
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withAlpha((0.5 * 255).toInt()),
                  labelText: 'Description',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  )
                ),
              ),


            ],
        ),
      ),
    );
  }
}
