import 'package:flutter/material.dart';
import 'package:fundamental_flutter/model/restourant.dart';

import '../style/theme.dart';

class ItemTabs extends StatelessWidget {
  String product;
  List<Drink> foods;

  ItemTabs({required this.foods, required this.product, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(
              foods[index].name,
              style: Theme.of(context).textTheme.headline6?.merge(title),
            ),
            leading: (product == 'foods')
                ? const Icon(Icons.fastfood_sharp)
                : const Icon(Icons.local_drink));
      },
    );
  }
}
