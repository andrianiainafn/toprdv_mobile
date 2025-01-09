import 'package:flutter/material.dart';
import 'package:my_template_project/core/global/action_button.dart';

class NotificationItemWidget extends StatelessWidget {
  final String title;
  final String body;
  final DateTime timestamp;

  const NotificationItemWidget({
    super.key,
    required this.title,
    required this.body,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        title: Text(title),
        subtitle: Text(body),
        trailing: Text(
          '${timestamp.hour}:${timestamp.minute}',
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
