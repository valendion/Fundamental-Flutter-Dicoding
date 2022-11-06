import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundamental_flutter/bloc/detail/detail_bloc.dart';
import 'package:fundamental_flutter/bloc/favorite/favorite_bloc.dart';
import 'package:fundamental_flutter/model/restourant_model.dart';
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
  final FavoriteBloc _favoriteBloc = FavoriteBloc();

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
        child: MultiBlocProvider(
          providers: [
            BlocProvider<DetailBloc>(
              create: (context) => _detailBloc,
            ),
            BlocProvider<FavoriteBloc>(
              create: (context) => _favoriteBloc,
            ),
          ],
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
                      _favoriteBloc.add(
                          IsFavoriteRestourant(id: state.restaurant.id ?? ''));
                      return _detailLayout(state.restaurant);
                    } else if (state is DetailShowMessageError) {
                      return NotFoundWidget(
                        message: somethingWrong,
                      );
                    } else {
                      return NotFoundWidget(
                        message: somethingWrong,
                      );
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

  Widget _favoriteBtn(bool status) {
    return Image.asset(
      (status) ? 'assets/img/lover.png' : 'assets/img/heart.png',
    );
  }

  Widget _detailLayout(Restaurant restourant) {
    bool status = false;
    if (restourant.id == null) {
      return NotFoundWidget(
        message: somethingWrong,
      );
    } else {
      return Stack(
        children: [
          Positioned(child: Image.asset('assets/img/lover.png')),
          Column(
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
                      style:
                          Theme.of(context).textTheme.button?.merge(subTitle)),
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
                      style:
                          Theme.of(context).textTheme.button?.merge(subTitle)),
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
              ReadMoreText(
                restourant.description!,
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
              TabView(menus: restourant.menus!)
            ],
          ),
          Positioned(
              right: 10,
              top: 180,
              child: SizedBox(
                  height: 40,
                  width: 40,
                  child: BlocListener<FavoriteBloc, FavoriteState>(
                    listener: (context, state) {
                      if (state is FavoriteMessage) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)));
                      } else if (state is FavoriteError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)));
                      }
                    },
                    child: InkWell(onTap: () {
                      if (status) {
                        _favoriteBloc.add(
                            NotFavoriteRestourant(id: restourant.id ?? ''));
                      } else {
                        var restourants = Restaurants(
                            id: restourant.id,
                            city: restourant.city,
                            description: restourant.description,
                            name: restourant.name,
                            pictureId: restourant.pictureId,
                            rating: restourant.rating);

                        _favoriteBloc
                            .add(FavoriteRestourant(restourants: restourants));
                      }
                    }, child: BlocBuilder<FavoriteBloc, FavoriteState>(
                        builder: (context, state) {
                      if (state is FavoriteInitial) {
                        return _favoriteBtn(state.initialStatus);
                      } else if (state is FavoriteLoadedRestourant) {
                        status = state.status;
                        return _favoriteBtn(status);
                      } else if (state is FavoriteRestourantStatus) {
                        status = state.status;
                        return _favoriteBtn(status);
                      } else {
                        return _favoriteBtn(status);
                      }
                    })),
                  )))
        ],
      );
    }
  }
}
