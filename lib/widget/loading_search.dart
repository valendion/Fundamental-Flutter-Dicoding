import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoadingSearchWidget extends StatelessWidget {
  const LoadingSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 250,
          width: 250,
          child: SvgPicture.asset('assets/img/ic_searching.svg')),
    );
  }
}
