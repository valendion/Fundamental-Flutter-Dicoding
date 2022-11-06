import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundamental_flutter/bloc/search/search_bloc.dart';
import 'package:fundamental_flutter/utils/text_string.dart';
import 'package:fundamental_flutter/widget/loading_search.dart';
import '../model/restourant_model.dart';
import '../style/theme.dart';
import '../widget/list_home_widget.dart';
import '../widget/not_found_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Restaurants> restourants = [];
    final SearchBloc _searchBloc = SearchBloc();

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocProvider(
          create: (context) => _searchBloc,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                search,
                style: Theme.of(context).textTheme.headline6?.merge(title),
              ),
              const SizedBox(
                height: 32,
              ),
              TextField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _searchBloc.add(GetSearchRestaurant(value));
                  } else {
                    _searchBloc.add(EmptyInput());
                  }
                },
                decoration: InputDecoration(
                    border: const OutlineInputBorder(), labelText: searchLabel),
              ),
              Expanded(
                  child: BlocListener<SearchBloc, SearchState>(
                      listener: (context, state) {
                if (state is SearchShowMessageError) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(terjadi_kesalahan)));
                }
              }, child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  print('State $state');
                  if (state is SearchInitial) {
                    return Container();
                  } else if (state is SearchLoading) {
                    return const LoadingSearchWidget();
                  } else if (state is SearchInput) {
                    return Container();
                  } else if (state is SearchLoaded) {
                    restourants = state.restourants;
                    return ListHomeWidget(
                      restourants: restourants,
                    );
                  } else if (state is SearchEmpty) {
                    return NotFoundWidget(message: noData);
                  } else if (state is SearchShowMessageError) {
                    return NotFoundWidget(message: somethingWrong);
                  } else {
                    return NotFoundWidget(message: somethingWrong);
                  }
                },
              )))
            ],
          ),
        ),
      )),
    );
  }
}
