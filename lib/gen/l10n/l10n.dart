// ignore_for_file
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n)!;
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja')
  ];

  /// No description provided for @trophyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Record'**
  String get trophyTitle;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @dialogClearTitle.
  ///
  /// In en, this message translates to:
  /// **'Cleared!'**
  String get dialogClearTitle;

  /// No description provided for @dialogDrawTitle.
  ///
  /// In en, this message translates to:
  /// **'Draw'**
  String get dialogDrawTitle;

  /// No description provided for @dialogFailTitle.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get dialogFailTitle;

  /// No description provided for @challengeLevel1.
  ///
  /// In en, this message translates to:
  /// **'Level 1'**
  String get challengeLevel1;

  /// No description provided for @challengeLevel2.
  ///
  /// In en, this message translates to:
  /// **'Level 2'**
  String get challengeLevel2;

  /// No description provided for @challengeLevel3.
  ///
  /// In en, this message translates to:
  /// **'Level 3'**
  String get challengeLevel3;

  /// No description provided for @challengeLevel4.
  ///
  /// In en, this message translates to:
  /// **'Level 4'**
  String get challengeLevel4;

  /// No description provided for @challengeLevel5.
  ///
  /// In en, this message translates to:
  /// **'Level 5'**
  String get challengeLevel5;

  /// No description provided for @challengeTitle1.
  ///
  /// In en, this message translates to:
  /// **'Level 1'**
  String get challengeTitle1;

  /// No description provided for @challengeDesc1.
  ///
  /// In en, this message translates to:
  /// **'Win with O within 7 moves'**
  String get challengeDesc1;

  /// No description provided for @challengeTitle2.
  ///
  /// In en, this message translates to:
  /// **'Level 2'**
  String get challengeTitle2;

  /// No description provided for @challengeDesc2.
  ///
  /// In en, this message translates to:
  /// **'O must win exactly on move 10'**
  String get challengeDesc2;

  /// No description provided for @challengeTitle3.
  ///
  /// In en, this message translates to:
  /// **'Level 3'**
  String get challengeTitle3;

  /// No description provided for @challengeDesc3.
  ///
  /// In en, this message translates to:
  /// **'□ must win exactly on move 15'**
  String get challengeDesc3;

  /// No description provided for @challengeTitle4.
  ///
  /// In en, this message translates to:
  /// **'Level 4'**
  String get challengeTitle4;

  /// No description provided for @challengeDesc4.
  ///
  /// In en, this message translates to:
  /// **'□ must win exactly on move 24'**
  String get challengeDesc4;

  /// No description provided for @challengeTitle5.
  ///
  /// In en, this message translates to:
  /// **'Level 5'**
  String get challengeTitle5;

  /// No description provided for @challengeDesc5.
  ///
  /// In en, this message translates to:
  /// **'End the game in a draw'**
  String get challengeDesc5;

  /// No description provided for @btnOkAgain.
  ///
  /// In en, this message translates to:
  /// **'Play again'**
  String get btnOkAgain;

  /// No description provided for @btnCancelTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get btnCancelTitle;

  /// No description provided for @winListTitle.
  ///
  /// In en, this message translates to:
  /// **'Winning patterns'**
  String get winListTitle;

  /// No description provided for @drawMessage.
  ///
  /// In en, this message translates to:
  /// **'It\'s a draw'**
  String get drawMessage;

  /// No description provided for @winSquare.
  ///
  /// In en, this message translates to:
  /// **'Square wins'**
  String get winSquare;

  /// No description provided for @winCircle.
  ///
  /// In en, this message translates to:
  /// **'O wins'**
  String get winCircle;

  /// No description provided for @winCross.
  ///
  /// In en, this message translates to:
  /// **'X wins'**
  String get winCross;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return L10nEn();
    case 'ja':
      return L10nJa();
  }

  throw FlutterError(
      'L10n.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
