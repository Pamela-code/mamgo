// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuizController on _QuizControllerBase, Store {
  late final _$answerAtom =
      Atom(name: '_QuizControllerBase.answer', context: context);

  @override
  TextEditingController get answer {
    _$answerAtom.reportRead();
    return super.answer;
  }

  @override
  set answer(TextEditingController value) {
    _$answerAtom.reportWrite(value, super.answer, () {
      super.answer = value;
    });
  }

  late final _$radioValueAtom =
      Atom(name: '_QuizControllerBase.radioValue', context: context);

  @override
  Object? get radioValue {
    _$radioValueAtom.reportRead();
    return super.radioValue;
  }

  @override
  set radioValue(Object? value) {
    _$radioValueAtom.reportWrite(value, super.radioValue, () {
      super.radioValue = value;
    });
  }

  late final _$visibleAtom =
      Atom(name: '_QuizControllerBase.visible', context: context);

  @override
  bool get visible {
    _$visibleAtom.reportRead();
    return super.visible;
  }

  @override
  set visible(bool value) {
    _$visibleAtom.reportWrite(value, super.visible, () {
      super.visible = value;
    });
  }

  @override
  String toString() {
    return '''
answer: ${answer},
radioValue: ${radioValue},
visible: ${visible}
    ''';
  }
}
