import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  String message;
  MessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(message));
  }
}
