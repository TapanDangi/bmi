import 'package:flutter/material.dart';
import 'package:bmi/components/customcard.dart';
import 'package:bmi/constant.dart';

class ResultPage extends StatefulWidget {
  const ResultPage(
      {Key? key,
      required this.gender,
      required this.age,
      required this.height,
      required this.weight})
      : super(key: key);
  final Gender gender;
  final int weight;
  final int age;
  final int height;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double bmi = 0.0;
  String result = '';
  String gender = '';
  String img = '';

  void calculate() {
    setState(() {
      gender = this.widget.gender == Gender.male ? 'male' : 'female';
      bmi = (this.widget.weight /
          ((this.widget.height / 100) * (this.widget.height / 100)));
      if (bmi < 18.5) {
        result = 'Underweight';
      } else if (bmi < 25) {
        result = 'Normal';
      } else if (bmi < 30) {
        result = 'Overweight';
      } else if (bmi < 35) {
        result = 'Obese';
      } else {
        result = 'ExtremelyObese';
      }
      img = 'images/${gender}_${result}.png';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      calculate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 10),
            child: const Text(
              'RESULT',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: CircleAvatar(
              radius: 150,
              backgroundColor: Colors.indigo,
              child: Image.asset(this.img),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Score: ',
                  style: TextStyle(
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  '${this.bmi.ceilToDouble()}',
                  style: const TextStyle(
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 5),
              borderRadius: BorderRadius.circular(40),
              color: Colors.deepPurple,
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 25, right: 25),
            child: Text(
              this.result,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            child: Container(
              height: 50,
              margin: const EdgeInsets.only(top: 73),
              child: BottomButton(
                title: 'RECALCULATE',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
