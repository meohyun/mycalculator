import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider extends StateNotifier<String>{
  CalculatorProvider(): super("");

  String userinput ="";
  String result = "";

  void handleButtons(String text){
    if(text == "AC"){
      userinput = "";
      result = "0";
      state = result;
      return ;
    }
    if(text == "+/-"){
      if (userinput.startsWith("-")){
        userinput = userinput.replaceAll("-", "");
        state = userinput;
      } else{
        userinput = "-" + userinput;
        state = userinput;
      }
      return ;
    }
    if(text == "C"){
      if(userinput.isNotEmpty){
        userinput = userinput.substring(0,userinput.length-1);
        state = userinput;
        return;
      }
      else{
        return null;
      }
    }
    if (text == "="){
      result = calculate();
      userinput = result;
      state = result;
      if (userinput.endsWith(".0")){
        userinput = userinput.replaceAll(".0", "");
        return;
      }
      if (result.endsWith(".0")){
        result = result.replaceAll(".0", "");
        state = result;
        return;
      }
    }
    userinput = userinput + text;
    state = userinput;
  }

  String calculate(){
    try{
      var exp = Parser().parse(userinput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    }
    catch(e){
      return "ERROR";
    }
  }

}