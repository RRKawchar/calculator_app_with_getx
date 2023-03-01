import 'package:calculator_app/constants/colors.dart';
import 'package:calculator_app/controller/calculator_controller.dart';
import 'package:calculator_app/widgets/reuslable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculationScreen extends StatelessWidget {
  final _controller = Get.put(CalculatorController());
  CalculationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          /// Input Output

          Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Obx(
                          () => ReusableText(
                        text: _controller.hideInput.value
                            ? ""
                            : _controller.input.value,
                        size: 48,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() => ReusableText(
                        text: _controller.output.value,
                        size: _controller.outputSize.value,
                        color: Colors.white.withOpacity(0.7))),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),),

          /// All Button
          Row(
            children: [
              calButton(
                  text: 'AC',
                  textColor: orangeColor,
                  buttonBGColor: operatorColor),
              calButton(
                  text: '<',
                  textColor: orangeColor,
                  buttonBGColor: operatorColor),
              calButton(text: '', buttonBGColor: Colors.transparent),
              calButton(
                  text: '/',
                  textColor: orangeColor,
                  buttonBGColor: operatorColor),
            ],
          ),
          Row(
            children: [
              calButton(text: '7'),
              calButton(text: '8'),
              calButton(
                text: '9',
              ),
              calButton(
                  text: 'x',
                  textColor: orangeColor,
                  buttonBGColor: operatorColor),
            ],
          ),
          Row(
            children: [
              calButton(text: '4'),
              calButton(text: '5'),
              calButton(
                text: '6',
              ),
              calButton(
                  text: '-',
                  textColor: orangeColor,
                  buttonBGColor: operatorColor),
            ],
          ),
          Row(
            children: [
              calButton(text: '1'),
              calButton(text: '2'),
              calButton(
                text: '3',
              ),
              calButton(
                  text: '+',
                  textColor: orangeColor,
                  buttonBGColor: operatorColor),
            ],
          ),
          Row(
            children: [
              calButton(text: '%'),
              calButton(text: '0'),
              calButton(
                text: '.',
              ),
              calButton(text: '=', buttonBGColor: orangeColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget calButton(
      {required text, textColor = Colors.white, buttonBGColor = buttonColor}) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(22),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: buttonBGColor),
        onPressed: () {
          _controller.onButtonClick(text);
        },
        child: ReusableText(
          text: text,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }
}
