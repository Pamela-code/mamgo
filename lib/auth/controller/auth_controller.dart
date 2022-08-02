import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  @observable
  TextEditingController name = TextEditingController();
}
