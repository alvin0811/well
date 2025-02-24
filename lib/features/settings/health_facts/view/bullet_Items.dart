import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class BulletItems extends StatelessWidget {
  final String bulletPoint;
  final Color color;
  const BulletItems({super.key, required this.bulletPoint , required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: SvgPicture.asset("assets/images/ic_checkbulletpoints.svg"),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Linkify(
                  style: TextStyle(color: color),
                  text: bulletPoint.toString(),
                  onOpen: (link) => _launchUrl(Uri.parse(link.url))),
              // Text(
              //   bulletPoint.toString(),
              //   textAlign: TextAlign.start,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}


class HealthFactBulletItems extends StatelessWidget {
  final String bulletPoint;
  const HealthFactBulletItems({super.key, required this.bulletPoint});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Linkify(
            style: const TextStyle(color: Colors.black),
              text: bulletPoint.toString(),
              onOpen: (link) => _launchUrl(Uri.parse(link.url))),
          // Text(
          //   bulletPoint.toString(),
          //   textAlign: TextAlign.start,
          // ),
        ),
      ],
    );
  }
}