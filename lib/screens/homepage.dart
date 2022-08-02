import 'package:bmi/screens/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:bmi/components/customcard.dart';
import 'package:bmi/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender gender_selected = Gender.male;
  int height = 180;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: GenderCard(
                    gender: 'MALE',
                    icon: Icons.male,
                    isSelected: gender_selected == Gender.male ? true : false,
                    onTap: () {
                      setState(() {
                        gender_selected = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: GenderCard(
                    gender: 'FEMALE',
                    icon: Icons.female,
                    isSelected: gender_selected == Gender.female ? true : false,
                    onTap: () {
                      setState(() {
                        gender_selected = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: SliderCard(
              value: height,
              title: 'HEIGHT',
              unit: ' cm',
              onChanged: (val) {
                setState(() {
                  height = val.toInt();
                });
              },
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  child: AWCard(
                    title: 'AGE',
                    value: age,
                    onPressedMinus: () {
                      setState(() {
                        age--;
                      });
                    },
                    onPressedPlus: () {
                      setState(() {
                        age++;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: AWCard(
                    title: 'WEIGHT',
                    value: weight,
                    onPressedMinus: () {
                      setState(() {
                        weight--;
                      });
                    },
                    onPressedPlus: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
              title: 'CALCULATE',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        gender: gender_selected,
                        age: age,
                        weight: weight,
                        height: height,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
