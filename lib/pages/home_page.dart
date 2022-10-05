import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundamental_flutter/style/theme.dart';
import 'package:fundamental_flutter/utils/text_string.dart';
import 'package:fundamental_flutter/widget/list_home_widget.dart';
import 'package:fundamental_flutter/widget/message_widget.dart';
import 'package:fundamental_flutter/widget/not_found_widget.dart';
import '../bloc/home/home_bloc.dart';
import '../widget/custom_widget.dart';
import '../widget/loading_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _homeBloc = HomeBloc();

  @override
  void initState() {
    _homeBloc.add(GetAllRestaurant());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocProvider(
          create: (context) => _homeBloc,
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
              Expanded(
                  child: BlocListener<HomeBloc, HomeState>(
                listener: (context, state) {
                  if (state is HomeShowMessageError) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                child:
                    BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                  if (state is HomeInitial) {
                    return LoadingWidget();
                  } else if (state is HomeLoading) {
                    return LoadingWidget();
                  } else if (state is HomeLoaded) {
                    if (state.restourants.length != 0) {
                      return ListHomeWidget(
                        restourants: state.restourants,
                      );
                    } else {
                      return NotFoundWidget();
                    }
                  } else if (state is HomeShowMessageError) {
                    return NotFoundWidget();
                  } else {
                    return NotFoundWidget();
                  }
                }),
              ))
            ],
          ),
        ),
      )),
    );
  }
}
