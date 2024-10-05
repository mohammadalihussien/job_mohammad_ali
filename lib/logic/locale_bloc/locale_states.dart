import 'dart:ui';

abstract class LocaleStates {}

class LocaleInitialState extends LocaleStates {}

class LocaleInProgress extends LocaleStates {}

class LocaleSuccess extends LocaleStates {
  Locale locale;
  LocaleSuccess({required this.locale});
}

class LocaleErrorState extends LocaleStates {}