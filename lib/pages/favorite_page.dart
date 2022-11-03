import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundamental_flutter/bloc/favorite_data/favorite_data_bloc.dart';
import 'package:fundamental_flutter/widget/list_home_widget.dart';
import 'package:fundamental_flutter/widget/loading_widget.dart';
import 'package:fundamental_flutter/widget/no_favorite.dart';
import '../style/theme.dart';
import '../utils/text_string.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FavoriteDataBloc _favoriteDataBloc = FavoriteDataBloc();

  @override
  void initState() {
    super.initState();
    _favoriteDataBloc.add(GetFavoriteRestourant());
  }

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
              favorite,
              style: Theme.of(context).textTheme.headline6?.merge(title),
            ),
            const SizedBox(
              height: 32,
            ),
            BlocProvider<FavoriteDataBloc>(
              create: (context) => _favoriteDataBloc,
              child: BlocListener<FavoriteDataBloc, FavoriteDataState>(
                listener: (context, state) {
                  if (state is FavoriteDataMessage) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                child: Expanded(child:
                    BlocBuilder<FavoriteDataBloc, FavoriteDataState>(
                        builder: (context, state) {
                  if (state is FavoriteDataInitial) {
                    return ListHomeWidget(restourants: []);
                  } else if (state is FavoriteDataLoaded) {
                    return ListHomeWidget(restourants: state.restourants);
                  } else if (state is FavoriteDataLoading) {
                    return const LoadingWidget();
                  } else if (state is FavoriteDataEmpty) {
                    return const NotFavoriteWidget();
                  } else {
                    return ListHomeWidget(restourants: []);
                  }
                })),
              ),
            )
          ],
        ),
      )),
    );
  }
}
