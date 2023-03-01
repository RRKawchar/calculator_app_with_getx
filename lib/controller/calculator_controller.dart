import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController{
  var input=''.obs;
  var output=''.obs;
  var operation=''.obs;

  var hideInput=false.obs;
  var outputSize=32.0.obs;

  onButtonClick(value){
    if(value=='AC'){
      input.value='';
      output.value='';

    }else if(value=='<'){
      if(input.isNotEmpty){
        input.value=input.substring(0,input.value.length-1);
      }


    }else if(value=='='){
      if(input.isNotEmpty){
        var userInput=input;
        userInput.value=input.replaceAll('x', '*');
        Parser p=Parser();
        Expression expression=p.parse(userInput.value);
        ContextModel cm=ContextModel();
        var finalValue=expression.evaluate(EvaluationType.REAL, cm);

        output.value=finalValue.toString();
        if(output.endsWith('.0')){
          output.value=output.substring(0,output.value.length-2);
        }
        input=output;
        hideInput.value=true;
        outputSize.value=52;
      }


    }else{
      input.value=input+value;
      hideInput.value=false;
      outputSize.value=32;
    }
    update();

  }


}