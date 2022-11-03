import 'package:flutter/material.dart';
import 'package:fundamental_flutter/utils/text_string.dart';

import '../style/theme.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textAlign: TextAlign.center,
        somethingWrong,
        style: Theme.of(context).textTheme.headline6?.merge(title),
      ),
    );
  }
}
