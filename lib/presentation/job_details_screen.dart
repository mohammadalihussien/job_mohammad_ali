import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_offers_mohammad_ali/logic/app_cubit.dart';
import 'package:job_offers_mohammad_ali/logic/job_details_bloc/job_details_bloc.dart';
import 'package:job_offers_mohammad_ali/logic/job_details_bloc/job_details_events.dart';
import 'package:job_offers_mohammad_ali/logic/job_details_bloc/job_details_states.dart';
import 'package:job_offers_mohammad_ali/logic/locale_bloc/locale_bloc.dart';

class JobDetailsScreen extends StatefulWidget {
  final String uuid;
  const JobDetailsScreen({super.key, required this.uuid});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  late JobDetailsBloc jobDetailsBloc;
  late LocaleBloc localeBloc;
  AppCubit appCubit = AppCubit(1);
  @override
  void initState() {
    jobDetailsBloc = BlocProvider.of<JobDetailsBloc>(context);
    jobDetailsBloc.add(FetchJobDetails(uuid: widget.uuid));
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
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ))
            ],
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios)),
          ),
          body: Stack(
            children: [
              Positioned(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: localeBloc.locale == Locale("en_US")
                          ? Text(
                              "تقدم",
                              style: TextStyle(color: Colors.white),
                            )
                          : Text(
                              "Apply",
                              style: TextStyle(color: Colors.white),
                            ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(108, 47, 128, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Set the border radius here
                          ))),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 76,
                ),
                bottom: 5,
                left: 0,
                right: 0,
              ),
              BlocBuilder<JobDetailsBloc, JobDetailsStates>(
                builder: (context, state) {
                  if (state is JobDetailsInProgress) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is JobDetailsSuccess) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      child: ListView(
                        children: [
                          ListTile(
                            title: Text(
                              state.job.data!.title!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading:
                                Image.network(state.job.data!.company!.logo!),
                            subtitle: Text(
                              state.job.data!.company!.industry!,
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          ListTile(
                            title: localeBloc.locale != Locale("en_US")
                                ? Text(state.job.data!.vertical!.nameEn!,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                                : Text(state.job.data!.vertical!.nameAr!,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                localeBloc.locale != Locale("en_US")
                                    ? Text(
                                        state.job.data!.location!.nameEn! +
                                            " . " +
                                            state.job.data!.workplacePreference!
                                                .nameEn! +
                                            " . " +
                                            state.job.data!.type!.nameEn!,
                                        style: TextStyle(fontSize: 10),
                                      )
                                    : Text(
                                        state.job.data!.location!.nameAr! +
                                            " . " +
                                            state.job.data!.workplacePreference!
                                                .nameAr! +
                                            " . " +
                                            state.job.data!.type!.nameAr!,
                                        style: TextStyle(fontSize: 10),
                                      ),
                                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          border: Border.all(
                                            color: Colors.black12,
                                          ),
                                          color:
                                              Color.fromRGBO(240, 234, 242, 1)),
                                      child: Text(
                                        state.job.data!.icpAnswers!.jobRole![0]
                                            .titleEn!,
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      padding: EdgeInsets.all(5),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          border: Border.all(
                                            color: Colors.black12,
                                          ),
                                          color:
                                              Color.fromRGBO(240, 234, 242, 1)),
                                      child: Text(
                                          state.job.data!.icpAnswers!
                                              .typesOfSales![0].titleEn!,
                                          style: TextStyle(fontSize: 10)),
                                      padding: EdgeInsets.all(5),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          ListTile(
                            title: localeBloc.locale != Locale("en_US")
                                ? Text(
                                    "Description",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    "الوصف",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                            subtitle: localeBloc.locale != Locale("en_US")
                                ? Text(
                                    state.job.data!.icpAnswers!.jobRole![0]
                                        .descriptionEn!,
                                    style: TextStyle(),
                                  )
                                : Text(
                                    state.job.data!.icpAnswers!.jobRole![0]
                                        .descriptionAr!,
                                    style: TextStyle()),
                          ),
                          ListTile(
                            title: localeBloc.locale != Locale("en_US")
                                ? Text("Key Responsibilities ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                                : Text("المسؤوليات ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: localeBloc.locale != Locale("en_US")
                                ? Text(
                                    state.job.data!.icpAnswers!.typesOfSales![0]
                                        .descriptionEn!,
                                    style: TextStyle(),
                                  )
                                : Text(
                                    state.job.data!.icpAnswers!.typesOfSales![0]
                                        .descriptionAr!,
                                    style: TextStyle()),
                          ),
                        ],
                      ),
                    );
                  } else if (state is JobDetailsErrorState) {
                    return Center(
                      child: localeBloc.locale != Locale("en_US")
                          ? Text("something went wrong", style: TextStyle())
                          : Text("حدث خطأ ما", style: TextStyle()),
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
          bottomNavigationBar: BlocBuilder<AppCubit, dynamic>(
            bloc: appCubit,
            builder: (context, index) => BottomNavigationBar(
                currentIndex: index,
                onTap: (index) {
                  appCubit.setState(index);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        "assets/images/briefcase-01.png",
                      ),
                      label: localeBloc.locale != Locale("en_US")
                          ? "Jobs"
                          : "الأعمال"),
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
        ),
      ),
    );
  }
}
