import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DailyFactsItems extends StatefulWidget {
  final void Function()? onTap;
  final String dailyFactsHeading;
  final String dailyFactImages;
  const DailyFactsItems(
      {super.key,
      this.onTap,
      required this.dailyFactsHeading,
      required this.dailyFactImages});

  @override
  State<DailyFactsItems> createState() => _DailyFactsItemsState();
}

class _DailyFactsItemsState extends State<DailyFactsItems> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        elevation: 10,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: const Color(0xFF235564),
                child: SvgPicture.asset(widget.dailyFactImages),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.dailyFactsHeading,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
