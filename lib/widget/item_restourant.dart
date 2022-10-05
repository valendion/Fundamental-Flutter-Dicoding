import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:fundamental_flutter/utils/constans.dart';
import 'package:fundamental_flutter/utils/text_string.dart';
import '../model/restourant_model.dart';
import '../style/theme.dart';

class ItemRestourant extends StatelessWidget {
  Restaurants restourant;
  ItemRestourant({required this.restourant, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {
        Navigator.pushNamed(context, detailPage, arguments: restourant);
      },
      borderRadius: 10,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Image border
            child: SizedBox.fromSize(
              size: const Size.fromRadius(48), // Image radius
              child: Hero(
                  tag: restourant.id ?? '',
                  child: Image.network(
                      '${Constans.mediumQualityImageUrl}${restourant.pictureId}',
                      fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restourant.name ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline5?.merge(title),
                ),
                const SizedBox(
                  height: 4,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(Icons.location_pin),
                    Text(restourant.city ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.merge(subTitle)),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(Icons.star_rate_rounded),
                    Text(restourant.rating.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.merge(subTitle)),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
