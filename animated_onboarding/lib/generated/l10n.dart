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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Best Digital Solutions`
  String get slide_1_title {
    return Intl.message(
      'Best Digital Solutions',
      name: 'slide_1_title',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor inc`
  String get slide_1_sub_title {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor inc',
      name: 'slide_1_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `Best Digital Solutions 2nd`
  String get slide_2_title {
    return Intl.message(
      'Best Digital Solutions 2nd',
      name: 'slide_2_title',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, incididunt ut labore et dolore magna aliqua.`
  String get slide_2_sub_title {
    return Intl.message(
      'Lorem ipsum dolor sit amet, incididunt ut labore et dolore magna aliqua.',
      name: 'slide_2_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `Best Digital Solutions 3rd`
  String get slide_3_title {
    return Intl.message(
      'Best Digital Solutions 3rd',
      name: 'slide_3_title',
      desc: '',
      args: [],
    );
  }

  /// `consectetur adipiscing elit, sed do eiusmod tempor incididunt ut .`
  String get slide_3_sub_title {
    return Intl.message(
      'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut .',
      name: 'slide_3_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
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
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}