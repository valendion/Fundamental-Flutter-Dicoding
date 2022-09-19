import 'package:flutter/material.dart';
import 'package:fundamental_flutter/model/restourant.dart';
import 'package:fundamental_flutter/style/theme.dart';
import 'package:fundamental_flutter/utils/asyn_data.dart';
import 'package:fundamental_flutter/utils/text_string.dart';
import 'package:fundamental_flutter/widget/item_restourant.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              greeting,
              style: Theme.of(context).textTheme.overline?.merge(subTitle),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              myName,
              style: Theme.of(context).textTheme.bodyText1?.merge(title),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              restourant,
              style: Theme.of(context).textTheme.headline6?.merge(title),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              subRestourant,
              style: Theme.of(context).textTheme.overline?.merge(subTitle),
            ),
            const SizedBox(
              height: 16,
            ),
            FutureBuilder<ResponseRestourant>(
                future: AsynData.getRestaurans(),
                initialData: ResponseRestourant(restaurants: []),
                builder: (context, snapshot) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data?.restaurants.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data?.restaurants[index] ??
                              Restaurant(
                                  id: '',
                                  name: '',
                                  description: '',
                                  pictureId: '',
                                  city: '',
                                  rating: 0.0,
                                  menus: Menus(drinks: [], foods: []));

                          return ItemRestourant(
                            restourant: data,
                          );
                        }),
                  );
                })
          ],
        ),
      )),
    );
  }
}
