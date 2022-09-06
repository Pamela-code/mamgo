import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mamgo/quiz/controller/quiz_controller.dart';
import 'package:mamgo/submit/view/submit_view.dart';
import 'package:mamgo/theme/widgets/button_manngo.dart';
import 'package:mamgo/theme/widgets/textfield_manngo.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  QuizController controller = QuizController();
  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if (controller.questions[widget.index]['type'] == 'dissertativa') {
      return _bodyDissertativa();
    } else {
      return _bodyAlternativas();
    }
  }

  _bodyDissertativa() {
    int questionNumber = widget.index + 1;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/logo2.png'),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Questão ${questionNumber.toString()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(controller.questions[widget.index]['question']),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              // height: 200,
              child: Form(
                key: _keyForm,
                child: TextFieldManngo(
                  controller: controller.answer,
                  label: 'Sua resposta aqui',
                  validator: (String? valor) {
                    if (valor == "") {
                      return "Por favor preencha esse campo";
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Observer(builder: (_) {
                return ButtonManngo(
                  label: controller.questions.length == widget.index + 1
                      ? 'Terminar'
                      : 'Próxima Pergunta',
                  onPressed: () {
                    if (_keyForm.currentState!.validate()) {
                      if (controller.questions.length == widget.index + 1) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const SubmitView(),
                            ),
                            (Route<dynamic> route) => false);
                      } else {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) =>
                                  QuestionView(index: widget.index + 1),
                            ),
                            (Route<dynamic> route) => false);
                      }
                    }
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  _bodyAlternativas() {
    int questionNumber = widget.index + 1;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/logo2.png'),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Questão ${questionNumber.toString()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(controller.questions[widget.index]['question']),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Observer(builder: (_) {
                  return Radio(
                      value: 1,
                      groupValue: controller.radioValue,
                      onChanged: (value) {
                        controller.radioValue = value;
                      });
                }),
                Text(controller.questions[widget.index]['option1']),
              ],
            ),
            Row(
              children: [
                Observer(builder: (_) {
                  return Radio(
                      value: 2,
                      groupValue: controller.radioValue,
                      onChanged: (value) {
                        controller.radioValue = value;
                      });
                }),
                Text(controller.questions[widget.index]['option2']),
              ],
            ),
            Row(
              children: [
                Observer(builder: (_) {
                  return Radio(
                      value: 3,
                      groupValue: controller.radioValue,
                      onChanged: (value) {
                        controller.radioValue = value;
                      });
                }),
                Text(controller.questions[widget.index]['option3']),
              ],
            ),
            Row(
              children: [
                Observer(builder: (_) {
                  return Radio(
                      value: 4,
                      groupValue: controller.radioValue,
                      onChanged: (value) {
                        controller.radioValue = value;
                      });
                }),
                Text(controller.questions[widget.index]['option4']),
              ],
            ),
            Observer(builder: (_) {
              return Visibility(
                visible: controller.visible,
                child: Column(
                  children: const [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Selecione uma opção',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              );
            }),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Observer(builder: (_) {
                return ButtonManngo(
                  label: controller.questions.length == widget.index + 1
                      ? 'Terminar'
                      : 'Próxima Pergunta',
                  onPressed: () {
                    if (controller.radioValue == 0) {
                      controller.visible = true;
                    } else {
                      if (controller.questions.length == widget.index + 1) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const SubmitView(),
                            ),
                            (Route<dynamic> route) => false);
                      } else {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) =>
                                  QuestionView(index: widget.index + 1),
                            ),
                            (Route<dynamic> route) => false);
                      }
                    }
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
