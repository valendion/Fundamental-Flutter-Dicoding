import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fundamental_flutter/utils/text_string.dart';

import '../style/theme.dart';

class NotFavoriteWidget extends StatelessWidget {
  const NotFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 150,
            width: 150,
            child: SvgPicture.asset('assets/img/no_data.svg')),
        const SizedBox(
          height: 16,
        ),
        Text(
          noData,
          style: Theme.of(context).textTheme.headline6?.merge(title),
        ),
      ],
    ));
  }
}
