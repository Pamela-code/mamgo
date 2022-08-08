import 'package:flutter/material.dart';
import 'package:mamgo/quiz/controller/quiz_controller.dart';
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
              height: 200,
              child: TextFieldManngo(
                controller: controller.answer,
                label: 'Sua resposta aqui',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ButtonManngo(
                label: 'Próxima Pergunta',
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) =>
                            QuestionView(index: widget.index + 1),
                      ),
                      (Route<dynamic> route) => false);
                },
              ),
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
                Radio(value: false, groupValue: 1, onChanged: (m) {}),
                Text(controller.questions[widget.index]['option1']),
              ],
            ),
            Row(
              children: [
                Radio(value: false, groupValue: 1, onChanged: (m) {}),
                Text(controller.questions[widget.index]['option2']),
              ],
            ),
            Row(
              children: [
                Radio(value: false, groupValue: 1, onChanged: (m) {}),
                Text(controller.questions[widget.index]['option3']),
              ],
            ),
            Row(
              children: [
                Radio(value: false, groupValue: 1, onChanged: (m) {}),
                Text(controller.questions[widget.index]['option4']),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ButtonManngo(
                label: 'Próxima Pergunta',
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) =>
                            QuestionView(index: widget.index + 1),
                      ),
                      (Route<dynamic> route) => false);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
