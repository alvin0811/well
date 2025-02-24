import 'package:flutter/material.dart';

class WeightIndicatorsWidget extends StatefulWidget {
  const WeightIndicatorsWidget({super.key});

  @override
  State<WeightIndicatorsWidget> createState() => _WeightIndicatorsWidgetState();
}

class _WeightIndicatorsWidgetState extends State<WeightIndicatorsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 6,
              backgroundColor: Color(0xFFFFD6B0),
            ),
            const SizedBox.square(dimension: 10),
            Text(
              "Low",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.black),
            ),
            const SizedBox.square(dimension: 10),
            const CircleAvatar(
              radius: 6,
              backgroundColor: Color(0xFF235564),
            ),
            const SizedBox.square(dimension: 10),
            Text(
              "Normal",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.black),
            ),
            const SizedBox.square(dimension: 10),
            const CircleAvatar(
              radius: 6,
              backgroundColor: Color(0xFFF63E16),
            ),
            const SizedBox.square(dimension: 10),
            Text(
              "High",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.black),
            )
          ],
        ),
      ],
    );
  }
}
