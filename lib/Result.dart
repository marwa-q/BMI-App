import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  Result(
      {Key? key,
      required this.gender,
      required this.hight,
      required this.weight,
      required this.age,
      required this.result})
      : super(key: key);

  final String gender;
  final double hight;
  final double weight;
  final int age;
  final double result;

  String get resultPhrase {
    String resultPhrase = '';

    if (result <= 18.4) {
      resultPhrase = 'Under Weight';
    } else if (result >= 18.5 && result <= 24.9) {
      resultPhrase = 'Normal';
    } else if (result >= 25.0 && result <= 39.9) {
      resultPhrase = 'Over Weight';
    } else {
      resultPhrase = 'Obese';
    }
    return resultPhrase;
  }

  // App colors variables
  Color mainColor = Colors.teal;
  Color backGroundColor = const Color.fromRGBO(255, 220, 174, 0.2);
  Color white = const Color.fromRGBO(255, 255, 255, 1);
  Color grey = Colors.grey;

  // Font style
  TextStyle textStyle = const TextStyle(
      color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        backgroundColor: mainColor,
      ),
      // ******** Information ********
      body: Center(
        child: Container(
          width: 350,
          height: 266,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView(
            children: [
              Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: grey)),
                  child: Text('Gender: $gender', style: textStyle)),
              Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: grey)),
                  child: Text('Hight: $hight', style: textStyle)),
              Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: grey)),
                  child: Text('Weight: $weight', style: textStyle)),
              Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: grey)),
                  child: Text('Age: $age', style: textStyle)),
              Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: grey)),
                  child: Text('BMI: ${result.toStringAsFixed(1)}',
                      style: textStyle)),
              Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: grey)),
                  child: Text('Your status: $resultPhrase', style: textStyle)),
            ],
          ),
        ),
      ),
    );
  }
}
