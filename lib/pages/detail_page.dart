import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundamental_flutter/bloc/detail/detail_bloc.dart';
import 'package:fundamental_flutter/style/color_theme.dart';
import 'package:fundamental_flutter/utils/text_string.dart';
import 'package:fundamental_flutter/widget/loading_widget.dart';
import 'package:readmore/readmore.dart';
import '../model/response_detail.dart';
import '../style/theme.dart';
import '../utils/constans.dart';
import '../widget/not_found_widget.dart';
import '../widget/tab_view.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final DetailBloc _detailBloc = DetailBloc();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as String;
    _detailBloc.add(GetDetailRestourant(args));

    return Scaffold(
      appBar: AppBar(
          title: Text(
        detailItem,
        style: Theme.of(context).textTheme.headline6?.merge(whiteText),
      )),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => _detailBloc,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocListener<DetailBloc, DetailState>(
                listener: (context, state) {
                  if (state is DetailShowMessageError) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                child: BlocBuilder<DetailBloc, DetailState>(
                  builder: (context, state) {
                    if (state is DetailInitial) {
                      return const LoadingWidget();
                    } else if (state is DetailLoading) {
                      return const LoadingWidget();
                    } else if (state is DetailLoaded) {
                      return _detailLayout(state.restaurant);
                    } else if (state is DetailShowMessageError) {
                      return const NotFoundWidget();
                    } else {
                      return const NotFoundWidget();
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _detailLayout(Restaurant restourant) {
    return Column(
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
                  tag: restourant.id!,
                  child: Image.network(
                      '${Constans.mediumQualityImageUrl}${restourant.pictureId}',
                      fit: BoxFit.cover)),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          restourant.name!,
          style: Theme.of(context).textTheme.headline6?.merge(title),
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(Icons.location_pin),
            Text(restourant.city!,
                style: Theme.of(context).textTheme.button?.merge(subTitle)),
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
          restourant.description!,
          trimLines: 5,
          colorClickableText: blackPrimary,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          moreStyle: Theme.of(context).textTheme.bodyText1?.merge(subTitle),
        ),
        const SizedBox(
          height: 16,
        ),
        TabView(menus: restourant.menus!)
      ],
    );
  }
}
