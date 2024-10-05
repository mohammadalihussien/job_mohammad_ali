import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_offers_mohammad_ali/logic/app_cubit.dart';
import 'package:job_offers_mohammad_ali/logic/job_details_bloc/job_details_bloc.dart';
import 'package:job_offers_mohammad_ali/logic/jobs_logic/jobs_bloc.dart';
import 'package:job_offers_mohammad_ali/logic/jobs_logic/jobs_event.dart';
import 'package:job_offers_mohammad_ali/logic/jobs_logic/jobs_states.dart';
import 'package:job_offers_mohammad_ali/logic/locale_bloc/locale_bloc.dart';

import 'job_details_screen.dart';

class JobsListScreen extends StatefulWidget {
  const JobsListScreen({super.key});

  @override
  State<JobsListScreen> createState() => _JobsListScreenState();
}

class _JobsListScreenState extends State<JobsListScreen> {
  late JobsBloc jobsBloc;
  late LocaleBloc localeBloc;

  AppCubit appCubit = AppCubit(0);
  @override
  void initState() {
    jobsBloc = BlocProvider.of<JobsBloc>(context);
    jobsBloc.add(StartFetchJobs());
    localeBloc = BlocProvider.of<LocaleBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: localeBloc.locale == Locale("en_US")
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: localeBloc.locale == Locale("en_US")
                ? Text("الأعمال",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ))
                : Text(
                    "Jobs",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ))
            ],
          ),
          bottomNavigationBar: BlocBuilder<AppCubit,dynamic>(
            bloc: appCubit,
            builder:(context,index)=> BottomNavigationBar(
              onTap: (index){
                appCubit.setState(index);
              },
                currentIndex: index,
                items: [
              BottomNavigationBarItem(
                  icon: index == 0 ? Image.asset(
                    "assets/images/briefcase-01.png",
                  ):Icon(Icons.shopping_bag_outlined),
                  label:
                      localeBloc.locale != Locale("en_US") ? "Jobs" : "الأعمال"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined),
                  label: localeBloc.locale != Locale("en_US")
                      ? "Resume"
                      : "السيرة الذاتية"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  label: localeBloc.locale != Locale("en_US")
                      ? "Setting"
                      : "الإعدادات")
            ]),
          ),
          body: BlocBuilder<JobsBloc, JobsStates>(
            builder: (context, state) {
              if (state is JobsFetchSuccess) {
                DateTime dateTime = new DateTime.now();
                return Container(
                  child: ListView.builder(
                      itemCount: state.allJobs.length,
                      itemBuilder: (context, i) {
                        DateTime givenDate =
                            DateTime.parse(state.allJobs[i].createdDate!);
                        return Container(
                          padding: localeBloc.locale == Locale("en_US")
                              ? EdgeInsets.only(left: 8, bottom: 5)
                              : EdgeInsets.only(right: 8, bottom: 5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                color: Colors.black12,
                              )),
                          margin: EdgeInsets.all(16),
                          child: Column(children: [
                            ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                        create: (context) => JobDetailsBloc(),
                                        child: JobDetailsScreen(
                                          uuid: state.allJobs[i].uuid!,
                                        ))));
                              },
                              title: localeBloc.locale == Locale("en_US")
                                  ? Text(
                                      state.allJobs[i].vertical!.nameAr!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(state.allJobs[i].vertical!.nameEn!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(state.allJobs[i].company!.name!,
                                      style: TextStyle(fontSize :10
                                      )),
                                  localeBloc.locale == Locale("en_US")
                                      ? Text(
                                          "${state.allJobs[i].location!.nameAr!} . ${state.allJobs[i].workplacePreference!.nameAr!}",
                                          style: TextStyle(fontSize :10
                                          ))
                                      : Text(
                                          "${state.allJobs[i].location!.nameEn!} . ${state.allJobs[i].workplacePreference!.nameEn!}",
                                          style: TextStyle(fontSize :10
                                          ))
                                ],
                              ),
                              leading: Image.network(
                                  state.allJobs[i].company!.logo!),
                            ),
                            dateTime.difference(givenDate).inMinutes < 60
                                ? Align(
                                    alignment:
                                        localeBloc.locale == Locale("en_US")
                                            ? Alignment.bottomLeft
                                            : Alignment.bottomRight,
                                    child: localeBloc.locale == Locale("en_US")
                                        ? Text(
                                            "${dateTime.difference(givenDate).inDays} دقيقة مضت",
                                            style: TextStyle(
                                              fontSize :10
                                            ))
                                        : Text(
                                            "${dateTime.difference(givenDate).inDays} minutes ago",
                                            style: TextStyle(fontSize :10
                                            )))
                                : dateTime.difference(givenDate).inHours < 24
                                    ? Align(
                                        alignment:
                                            localeBloc.locale == Locale("en_US")
                                                ? Alignment.bottomLeft
                                                : Alignment.bottomRight,
                                        child: localeBloc.locale ==
                                                Locale("en_US")
                                            ? Text(
                                                "${dateTime.difference(givenDate).inDays} ساعة مضت",
                                                style: TextStyle(
                                                  fontSize :10
                                                ))
                                            : Text(
                                                "${dateTime.difference(givenDate).inDays} hours ago",
                                                style: TextStyle(
                                                  fontSize :10
                                                )))
                                    : Align(
                                        alignment:
                                            localeBloc.locale == Locale("en_US")
                                                ? Alignment.bottomLeft
                                                : Alignment.bottomRight,
                                        child: localeBloc.locale ==
                                                Locale("en_US")
                                            ? Text(
                                                "${dateTime.difference(givenDate).inDays} يوم مضى",
                                                style: TextStyle(
                                                  fontSize :10
                                                ))
                                            : Text(
                                                "${dateTime.difference(givenDate).inDays} days ago",
                                                style: TextStyle(
                                                  fontSize :10
                                                )))
                          ]),
                        );
                      }),
                );
              } else if (state is JobsFetchInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is JobsFetchError) {
                return Center(
                  child: localeBloc.locale == Locale("en_US")
                      ? Text("حدث خطأ ما",
                          style: TextStyle(
                          ))
                      : Text("something went wrong",
                          style: TextStyle(
                          )),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
