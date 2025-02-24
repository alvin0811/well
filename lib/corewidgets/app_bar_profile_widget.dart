import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_path/corewidgets/app_network_image.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/gen/assets.gen.dart';

class ProfileViewWidget extends StatelessWidget {
  const ProfileViewWidget({
    required this.name,
    required this.image,
    super.key,
  });
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          image.toString().isNotNull && image.isNotEmpty
              ? ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: AppNetworkImage(
                    image,
                    height: 40,
                    width: 40,
                  ),
                )
              : SvgPicture.asset(
                  Assets.images.icProfilePlaceholderSvg,
                  width: 40,
                  height: 40,
                ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name.length > 10
                    ? 'Hi ${name.substring(0, 10)}...'
                    : "Hi $name",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontSize: 16),
                textAlign: TextAlign.start,
              ),
              Text(
                "Welcome Back",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 13),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
