part of 'localization_bloc.dart';

sealed class LocalizationEvent {}

class ChangeLanguageEvent extends LocalizationEvent {
  final String? languageCode;

  ChangeLanguageEvent({required this.languageCode});
}

class GetSavedLanguageEvent extends LocalizationEvent {}
