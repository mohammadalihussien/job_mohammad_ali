import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:job_offers_mohammad_ali/logic/locale_bloc/locale_events.dart';
import 'package:job_offers_mohammad_ali/logic/locale_bloc/locale_states.dart';

class LocaleBloc extends Bloc<LocaleEvents,LocaleStates>{
  late Locale locale;
  LocaleBloc():super(LocaleInitialState()){
    on<DetectLocale>((event,state) {
      emit(LocaleInProgress());
      locale = Get.deviceLocale!;
      emit(LocaleSuccess(locale: locale));
    });
  }

}