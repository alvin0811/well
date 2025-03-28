import 'package:flutter/material.dart';

class ChartContainer extends StatelessWidget {
  final Color color;
  final String title;
  final Widget chart;

  const ChartContainer({
    Key? key,
    required this.title,
    required this.color,
    required this.chart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.width * 0.95 * 0.65,
        padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   title,
            //   style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 16,
            //       fontWeight: FontWeight.bold),
            // ),
            Expanded(
                child: Container(
              child: chart,
            ))
          ],
        ),
      ),
    );
  }
}
