import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_offers_mohammad_ali/logic/jobs_logic/jobs_bloc.dart';
import 'package:job_offers_mohammad_ali/logic/locale_bloc/locale_bloc.dart';
import 'package:job_offers_mohammad_ali/logic/locale_bloc/locale_events.dart';
import 'package:job_offers_mohammad_ali/logic/locale_bloc/locale_states.dart';
import 'package:job_offers_mohammad_ali/presentation/jobs_list_screen.dart';

void main() {
  runApp(BlocProvider(
      create: (BuildContext context) => LocaleBloc()..add(DetectLocale()),
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  late LocaleBloc localeBloc;
  @override
  void initState() {
    localeBloc = BlocProvider.of<LocaleBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, LocaleStates>(
        bloc: localeBloc,
        builder: (context, state) {
          if (state is LocaleSuccess) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: state.locale,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: BlocProvider(
                  create: (context) => JobsBloc(), child: JobsListScreen()),
            );
          }
          return Container();
        });
  }
}
