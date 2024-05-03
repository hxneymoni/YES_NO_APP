import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entitities/message.dart';
import 'package:intl/intl.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          DateFormat('HH:mm')
              .format(message.sentTime), // Muestra la hora debajo del mensaje
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
