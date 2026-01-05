// ignore_for_file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get trophyTitle => 'Your Record';

  @override
  String get reset => 'Reset';

  @override
  String get dialogClearTitle => 'Cleared!';

  @override
  String get dialogDrawTitle => 'Draw';

  @override
  String get dialogFailTitle => 'Failed';

  @override
  String get challengeLevel1 => 'Level 1';

  @override
  String get challengeLevel2 => 'Level 2';

  @override
  String get challengeLevel3 => 'Level 3';

  @override
  String get challengeLevel4 => 'Level 4';

  @override
  String get challengeLevel5 => 'Level 5';

  @override
  String get challengeTitle1 => 'Level 1';

  @override
  String get challengeDesc1 => 'Win with O within 7 moves';

  @override
  String get challengeTitle2 => 'Level 2';

  @override
  String get challengeDesc2 => 'O must win exactly on move 10';

  @override
  String get challengeTitle3 => 'Level 3';

  @override
  String get challengeDesc3 => '□ must win exactly on move 15';

  @override
  String get challengeTitle4 => 'Level 4';

  @override
  String get challengeDesc4 => '□ must win exactly on move 24';

  @override
  String get challengeTitle5 => 'Level 5';

  @override
  String get challengeDesc5 => 'End the game in a draw';

  @override
  String get btnOkAgain => 'Play again';

  @override
  String get btnCancelTitle => 'Title';

  @override
  String get winListTitle => 'Winning patterns';

  @override
  String get drawMessage => 'It\'s a draw';

  @override
  String get winSquare => 'Square wins';

  @override
  String get winCircle => 'O wins';

  @override
  String get winCross => 'X wins';
}
