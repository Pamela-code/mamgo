import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
part 'quiz_controller.g.dart';

class QuizController = _QuizControllerBase with _$QuizController;

abstract class _QuizControllerBase with Store {
  ObservableList<Map> questions = ObservableList.of([
    {
      'number': '1',
      'type': 'alternativas',
      'question': 'Isso é uma pergunta?',
      'option1': 'sim',
      'option2': 'não',
      'option3': 'talvez',
      'option4': 'todas as anteriores',
    },
    {
      'number': '2',
      'type': 'dissertativa',
      'question': 'Que pergunta é essa?',
    }
  ]);

  @observable
  TextEditingController answer = TextEditingController();

  @observable
  Object? radioValue = 0;

  @observable
  bool visible = false;
}
