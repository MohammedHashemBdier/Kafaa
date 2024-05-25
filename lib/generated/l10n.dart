// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Kafa'a App Dash Board`
  String get title {
    return Intl.message(
      'Kafa\'a App Dash Board',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Entr the Password`
  String get entr_the_password {
    return Intl.message(
      'Entr the Password',
      name: 'entr_the_password',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Employees`
  String get employees {
    return Intl.message(
      'Employees',
      name: 'employees',
      desc: '',
      args: [],
    );
  }

  /// `Targets`
  String get targets {
    return Intl.message(
      'Targets',
      name: 'targets',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notification {
    return Intl.message(
      'Notifications',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Add an Employee`
  String get add_an_employee {
    return Intl.message(
      'Add an Employee',
      name: 'add_an_employee',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Add Name`
  String get add_name {
    return Intl.message(
      'Add Name',
      name: 'add_name',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Add Username`
  String get add_username {
    return Intl.message(
      'Add Username',
      name: 'add_username',
      desc: '',
      args: [],
    );
  }

  /// `Add Password`
  String get add_password {
    return Intl.message(
      'Add Password',
      name: 'add_password',
      desc: '',
      args: [],
    );
  }

  /// `Department`
  String get department {
    return Intl.message(
      'Department',
      name: 'department',
      desc: '',
      args: [],
    );
  }

  /// `Add Department`
  String get add_department {
    return Intl.message(
      'Add Department',
      name: 'add_department',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Add Phone Number`
  String get add_phone_number {
    return Intl.message(
      'Add Phone Number',
      name: 'add_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobile_number {
    return Intl.message(
      'Mobile Number',
      name: 'mobile_number',
      desc: '',
      args: [],
    );
  }

  /// `Add Mobile Number`
  String get add_mobile_number {
    return Intl.message(
      'Add Mobile Number',
      name: 'add_mobile_number',
      desc: '',
      args: [],
    );
  }

  /// `Date of Joining the Department`
  String get date_of_joining_the_department {
    return Intl.message(
      'Date of Joining the Department',
      name: 'date_of_joining_the_department',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get select_date {
    return Intl.message(
      'Select Date',
      name: 'select_date',
      desc: '',
      args: [],
    );
  }

  /// `ID Number`
  String get id_number {
    return Intl.message(
      'ID Number',
      name: 'id_number',
      desc: '',
      args: [],
    );
  }

  /// `Add ID Number`
  String get add_id_number {
    return Intl.message(
      'Add ID Number',
      name: 'add_id_number',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Add Address`
  String get add_address {
    return Intl.message(
      'Add Address',
      name: 'add_address',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get date_of_birth {
    return Intl.message(
      'Date of Birth',
      name: 'date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Academic Specialization`
  String get academic_specialization {
    return Intl.message(
      'Academic Specialization',
      name: 'academic_specialization',
      desc: '',
      args: [],
    );
  }

  /// `Add Academic Specialization`
  String get add_academic_specialization {
    return Intl.message(
      'Add Academic Specialization',
      name: 'add_academic_specialization',
      desc: '',
      args: [],
    );
  }

  /// `Work State`
  String get work_state {
    return Intl.message(
      'Work State',
      name: 'work_state',
      desc: '',
      args: [],
    );
  }

  /// `Add Work State`
  String get add_work_state {
    return Intl.message(
      'Add Work State',
      name: 'add_work_state',
      desc: '',
      args: [],
    );
  }

  /// `Work`
  String get work {
    return Intl.message(
      'Work',
      name: 'work',
      desc: '',
      args: [],
    );
  }

  /// `Not Work`
  String get not_work {
    return Intl.message(
      'Not Work',
      name: 'not_work',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get info {
    return Intl.message(
      'Info',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `The Search`
  String get the_search {
    return Intl.message(
      'The Search',
      name: 'the_search',
      desc: '',
      args: [],
    );
  }

  /// `Search for an Employee`
  String get search_for_an_employee {
    return Intl.message(
      'Search for an Employee',
      name: 'search_for_an_employee',
      desc: '',
      args: [],
    );
  }

  /// `Employee Info`
  String get employee_info {
    return Intl.message(
      'Employee Info',
      name: 'employee_info',
      desc: '',
      args: [],
    );
  }

  /// `Save Edits`
  String get save_edits {
    return Intl.message(
      'Save Edits',
      name: 'save_edits',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to Logout?`
  String get do_you_want_to_logout {
    return Intl.message(
      'Do you want to Logout?',
      name: 'do_you_want_to_logout',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete the Employee?`
  String get do_you_want_to_delete_the_employee {
    return Intl.message(
      'Do you want to delete the Employee?',
      name: 'do_you_want_to_delete_the_employee',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to add an Employee?`
  String get do_you_want_to_add_an_employee {
    return Intl.message(
      'Do you want to add an Employee?',
      name: 'do_you_want_to_add_an_employee',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to save the edits?`
  String get do_you_want_to_save_the_edits {
    return Intl.message(
      'Do you want to save the edits?',
      name: 'do_you_want_to_save_the_edits',
      desc: '',
      args: [],
    );
  }

  /// `Alart`
  String get alart {
    return Intl.message(
      'Alart',
      name: 'alart',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `You are now logged in`
  String get you_are_now_logged_in {
    return Intl.message(
      'You are now logged in',
      name: 'you_are_now_logged_in',
      desc: '',
      args: [],
    );
  }

  /// `Colose`
  String get close {
    return Intl.message(
      'Colose',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Main Menu`
  String get main_menu {
    return Intl.message(
      'Main Menu',
      name: 'main_menu',
      desc: '',
      args: [],
    );
  }

  /// `App and User Sittings`
  String get app_and_user_sittings {
    return Intl.message(
      'App and User Sittings',
      name: 'app_and_user_sittings',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get admin {
    return Intl.message(
      'Admin',
      name: 'admin',
      desc: '',
      args: [],
    );
  }

  /// `Last Login`
  String get last_login {
    return Intl.message(
      'Last Login',
      name: 'last_login',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Choose a Language`
  String get choose_a_language {
    return Intl.message(
      'Choose a Language',
      name: 'choose_a_language',
      desc: '',
      args: [],
    );
  }

  /// `The Language`
  String get the_language {
    return Intl.message(
      'The Language',
      name: 'the_language',
      desc: '',
      args: [],
    );
  }

  /// `Change The Password`
  String get change_the_password {
    return Intl.message(
      'Change The Password',
      name: 'change_the_password',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get old_password {
    return Intl.message(
      'Old Password',
      name: 'old_password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
