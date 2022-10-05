import 'package:flutter/material.dart';

import '../model/restourant_model.dart';
import 'item_restourant.dart';

class ListHomeWidget extends StatelessWidget {
  List<Restaurants> restourants;
  ListHomeWidget({super.key, required this.restourants});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: restourants.length,
        itemBuilder: (context, index) {
          var data = restourants[index];

          return ItemRestourant(
            restourant: data,
          );
        });
  }
}
