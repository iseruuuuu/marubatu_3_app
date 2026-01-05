// ignore_for_file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get trophyTitle => 'あなたの記録';

  @override
  String get reset => 'リセット';

  @override
  String get dialogClearTitle => 'クリア！';

  @override
  String get dialogDrawTitle => '引き分け';

  @override
  String get dialogFailTitle => '失敗';

  @override
  String get challengeLevel1 => 'レベル１';

  @override
  String get challengeLevel2 => 'レベル２';

  @override
  String get challengeLevel3 => 'レベル３';

  @override
  String get challengeLevel4 => 'レベル４';

  @override
  String get challengeLevel5 => 'レベル５';

  @override
  String get challengeTitle1 => 'レベル1';

  @override
  String get challengeDesc1 => '7手以内に◯で勝利せよ';

  @override
  String get challengeTitle2 => 'レベル2';

  @override
  String get challengeDesc2 => '10手ぴったりで◯が勝利';

  @override
  String get challengeTitle3 => 'レベル3';

  @override
  String get challengeDesc3 => '15手ぴったりで□が勝利';

  @override
  String get challengeTitle4 => 'レベル4';

  @override
  String get challengeDesc4 => '24手ぴったりで□が勝利';

  @override
  String get challengeTitle5 => 'レベル5';

  @override
  String get challengeDesc5 => '引き分けにしろ';

  @override
  String get btnOkAgain => 'もう一度';

  @override
  String get btnCancelTitle => 'タイトル';

  @override
  String get winListTitle => '勝ち手一覧';

  @override
  String get drawMessage => '引き分けです';

  @override
  String get winSquare => '□の勝ち';

  @override
  String get winCircle => '◯の勝ち';

  @override
  String get winCross => '×の勝ち';
}
