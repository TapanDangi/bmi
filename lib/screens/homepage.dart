import 'package:bmi/screens/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:bmi/components/customcard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int height = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculation'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: const [
                Expanded(
                  child: GenderCard(
                    gender: 'MALE',
                    icon: Icons.male,
                  ),
                ),
                Expanded(
                  child: GenderCard(
                    gender: 'FEMALE',
                    icon: Icons.female,
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
              children: const [
                Expanded(
                  child: AWCard(
                    title: 'AGE',
                    value: 20,
                  ),
                ),
                Expanded(
                  child: AWCard(
                    title: 'WEIGHT',
                    value: 50,
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
                      return const ResultPage();
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
