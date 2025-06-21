import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final Map<String, dynamic> note;
  final Function ontap;
  final Function onDelete;
  final List<Color> notecolors;

  NoteCard({
    super.key,
    required this.note,
    required this.ontap,
    required this.onDelete,
    required List<int> notecolors,
  }) : notecolors = notecolors.map((c) => Color(c)).toList();

  @override
  Widget build(BuildContext context) {
    final colorIndex = note['color'] as int;

    return GestureDetector(
      onTap: () =>
          ontap(note['id'], note['title'], note['description'], colorIndex),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: notecolors[colorIndex],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note['date'], // Fixed field name
              style: const TextStyle(color: Colors.black54, fontSize: 12),
            ),
            const SizedBox(height: 8),
            Text(
              note['title'],
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                note['description'], // Fixed field name
                style: const TextStyle(color: Colors.black87, fontSize: 14),
                overflow: TextOverflow.fade,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Color.fromARGB(174, 244, 67, 54),
                  ),
                  onPressed: () => onDelete(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
