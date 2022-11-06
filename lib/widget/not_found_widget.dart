import 'package:flutter/material.dart';
import 'package:fundamental_flutter/utils/text_string.dart';

import '../style/theme.dart';

class NotFoundWidget extends StatelessWidget {
  final String message;
  const NotFoundWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textAlign: TextAlign.center,
        message,
        style: Theme.of(context).textTheme.headline6?.merge(title),
      ),
    );
  }
}
