import 'package:flutter/material.dart';
import 'package:fundamental_flutter/model/response_detail.dart';

import '../style/theme.dart';

class ItemTabs extends StatelessWidget {
  String product;
  Menus menus;

  ItemTabs({required this.menus, required this.product, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          (product == 'foods') ? menus.foods!.length : menus.drinks!.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(
              (product == 'foods')
                  ? menus.foods![index].name
                  : menus.drinks![index].name,
              style: Theme.of(context).textTheme.headline6?.merge(title),
            ),
            leading: (product == 'foods')
                ? const Icon(Icons.fastfood_sharp)
                : const Icon(Icons.local_drink));
      },
    );
  }
}
