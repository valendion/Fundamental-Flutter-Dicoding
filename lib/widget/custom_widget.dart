import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/restourant_model.dart';
import 'item_restourant.dart';

class CustomWidget {
  static Widget _buildLoading() => const Center(
        child: CircularProgressIndicator(),
      );

  static Widget _listRestourant(List<Restaurants> restourants) {
    return ListView.builder(
        itemCount: restourants.length,
        itemBuilder: (context, index) {
          var data = restourants[index];

          return ItemRestourant(
            restourant: data,
          );
        });
  }

  static Widget _buildWhenError() => Center(
        child: SizedBox(
            height: 250,
            width: 250,
            child: SvgPicture.asset('assets/img/illustration_iot.svg')),
      );
}
