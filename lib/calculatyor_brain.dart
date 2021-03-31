import 'dart:math';
import 'package:flutter/material.dart';
class CalBrain{
  CalBrain({@required this.height,@required this.weight});
  final int height;
  final int weight;

  double _bmi= 0.0;

  String calculateBmi(){

    _bmi = weight / pow(height/100, 2);
    // print(_bmi);
    return _bmi.toStringAsFixed(2);
  }
  String getResult(){
    // print(_bmi);
    if (_bmi > 18.5 && _bmi < 25.0){
      return 'Normal';
    }
    else if (_bmi >= 25.0){
      return 'Overweight';
    }
    else if (_bmi < 18.5){
      return 'Underweight';
    }
  }
  String getInterpatation(){
    if (_bmi >= 25){
      return'You have the higher than normal body weight. Try to exercise more';
    }
    else if (_bmi >= 18.5){
      return 'You have normal body weight good job';
    }else{
      return 'You have a lower than normal body weight.You can eat a bit more';
    }
  }
}