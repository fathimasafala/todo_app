import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function(bool?) onChanged;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const TaskTile({
    super.key,
    required this.title,
    required this.isDone,
    required this.onChanged,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 49,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.brown[300]!)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: Colors.brown[300], shape: BoxShape.circle),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(title)
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: onEdit,
                  child: const Icon(
                    Icons.edit,
                    color: Colors.grey,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: onDelete,
                  child: const Icon(Icons.delete, color: Colors.red, size: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
