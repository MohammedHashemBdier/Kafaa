part of 'localization_bloc.dart';

sealed class LocalizationEvent {}

class GetAppLanguageEvent extends LocalizationEvent {}

class ChangeLanguageEvent extends LocalizationEvent {
  final String? languageCode;

  ChangeLanguageEvent({required this.languageCode});
}
