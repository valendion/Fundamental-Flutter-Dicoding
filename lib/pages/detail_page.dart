import 'package:flutter/material.dart';
import 'package:fundamental_flutter/style/color_theme.dart';
import 'package:fundamental_flutter/utils/text_string.dart';
import 'package:readmore/readmore.dart';

import '../model/restourant.dart';
import '../style/theme.dart';
import '../widget/tab_view.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Restaurant;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        detailItem,
        style: Theme.of(context).textTheme.headline6?.merge(whiteText),
      )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Image border
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(48), // Image radius
                      child: Hero(
                          tag: args.id,
                          child:
                              Image.network(args.pictureId, fit: BoxFit.cover)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  args.name,
                  style: Theme.of(context).textTheme.headline6?.merge(title),
                ),
                const SizedBox(
                  height: 8,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(Icons.location_pin),
                    Text(args.city,
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.merge(subTitle)),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.subtitle1?.merge(title),
                ),
                const SizedBox(
                  height: 8,
                ),
                // Text(
                //   args.description,
                //   style: Theme.of(context).textTheme.subtitle1?.merge(title),
                // ),
                ReadMoreText(
                  args.description,
                  trimLines: 5,
                  colorClickableText: blackPrimary,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle:
                      Theme.of(context).textTheme.bodyText1?.merge(subTitle),
                ),
                const SizedBox(
                  height: 16,
                ),
                TabView(menus: args.menus)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
