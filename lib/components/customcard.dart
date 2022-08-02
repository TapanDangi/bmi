import 'package:flutter/material.dart';
import 'package:bmi/constant.dart';

class GenderCard extends StatelessWidget {
  const GenderCard(
      {Key? key,
      required this.gender,
      required this.icon,
      required this.onTap,
      required this.isSelected})
      : super(key: key);
  final IconData icon;
  final String gender;
  final onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? cCardPrimaryBGColorSelected : cCardPrimaryBGColor,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        margin: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              this.icon,
              size: 80,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              this.gender,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AWCard extends StatelessWidget {
  const AWCard(
      {Key? key,
      this.title = '',
      this.value = 0,
      required this.onPressedMinus,
      required this.onPressedPlus})
      : super(key: key);
  final String title;
  final int value;
  final onPressedMinus;
  final onPressedPlus;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cCardPrimaryBGColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      margin: const EdgeInsets.only(bottom: 30, top: 15, left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.title,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
          Text(
            '${this.value}',
            style: const TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonRound(
                text: '-',
                onPressed: this.onPressedMinus,
              ),
              SizedBox(width: 20),
              ButtonRound(
                text: '+',
                onPressed: this.onPressedPlus,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ButtonRound extends StatelessWidget {
  const ButtonRound({Key? key, this.text = '', required this.onPressed})
      : super(key: key);
  final String text;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      child: ElevatedButton(
        onPressed: this.onPressed,
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Text(
            this.text,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}

class SliderCard extends StatelessWidget {
  const SliderCard(
      {Key? key,
      this.title = '',
      this.value = 0,
      this.unit = '',
      required this.onChanged})
      : super(key: key);
  final String title;
  final int value;
  final String unit;
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cCardPrimaryBGColor,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.title,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '${this.value}',
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                this.unit,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.green,
              inactiveTrackColor: Colors.lightBlue,
              thumbColor: Colors.lightGreenAccent,
              overlayColor: Colors.lightGreen,
            ),
            child: Slider(
              value: this.value.toDouble(),
              min: 0.0,
              max: 250.0,
              onChanged: this.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(10),
        child: Text(
          this.title,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
