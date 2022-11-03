import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundamental_flutter/bloc/settings/reminder/rimender_bloc.dart';
import 'package:fundamental_flutter/utils/date_time_helper.dart';
import 'package:fundamental_flutter/utils/text_string.dart';
import 'package:fundamental_flutter/utils/background_service.dart';

import '../style/theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var status = false;
  final RimenderBloc _rimenderBloc = RimenderBloc();

  @override
  void initState() {
    super.initState();
    _rimenderBloc.add(GetRimender());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                setting,
                style: Theme.of(context).textTheme.headline6?.merge(title),
              ),
              const SizedBox(
                height: 32,
              ),
              BlocProvider<RimenderBloc>(
                create: (context) => _rimenderBloc,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            scheduling_news,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.merge(title),
                          ),
                          const Spacer(),
                          BlocListener<RimenderBloc, RimenderState>(
                            listener: (context, state) {
                              if (state is RimenderMessage) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(state.message)));
                              } else if (state is RimenderLoaded) {
                                _rimenderRestourant(state.status);
                              }
                            },
                            child: BlocBuilder<RimenderBloc, RimenderState>(
                              builder: (context, state) {
                                if (state is RimenderInitial) {
                                  status = state.status;
                                  return _settingUi(status);
                                } else if (state is RimenderLoaded) {
                                  status = state.status;
                                  return _settingUi(status);
                                } else {
                                  return _settingUi(status);
                                }
                              },
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingUi(bool status) {
    return Switch.adaptive(
        value: status,
        onChanged: (value) {
          if (status) {
            print('Click status $status');
            print('Click value $value');
            _rimenderBloc.add(SetOffRimender());
          } else {
            _rimenderBloc.add(SetOnRimender());
          }
        });
  }

  Future<bool> _rimenderRestourant(bool status) async {
    if (status) {
      return await AndroidAlarmManager.periodic(
          const Duration(hours: 24), 1, BackgroundService.callback,
          startAt: DateTimeHelper.format(), exact: true, wakeup: true);
    } else {
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
