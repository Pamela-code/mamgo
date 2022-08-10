// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SubmitController on _SubmitControllerBase, Store {
  late final _$latitudeAtom =
      Atom(name: '_SubmitControllerBase.latitude', context: context);

  @override
  double? get latitude {
    _$latitudeAtom.reportRead();
    return super.latitude;
  }

  @override
  set latitude(double? value) {
    _$latitudeAtom.reportWrite(value, super.latitude, () {
      super.latitude = value;
    });
  }

  late final _$longitudeAtom =
      Atom(name: '_SubmitControllerBase.longitude', context: context);

  @override
  double? get longitude {
    _$longitudeAtom.reportRead();
    return super.longitude;
  }

  @override
  set longitude(double? value) {
    _$longitudeAtom.reportWrite(value, super.longitude, () {
      super.longitude = value;
    });
  }

  late final _$_determinePositionAsyncAction =
      AsyncAction('_SubmitControllerBase._determinePosition', context: context);

  @override
  Future<Position> _determinePosition() {
    return _$_determinePositionAsyncAction
        .run(() => super._determinePosition());
  }

  late final _$getPositionAsyncAction =
      AsyncAction('_SubmitControllerBase.getPosition', context: context);

  @override
  Future getPosition() {
    return _$getPositionAsyncAction.run(() => super.getPosition());
  }

  @override
  String toString() {
    return '''
latitude: ${latitude},
longitude: ${longitude}
    ''';
  }
}
