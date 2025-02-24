import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_path/colors/colors.dart';
import 'package:well_path/corewidgets/custom_container_widget.dart';

class BinaryChoiceWidget extends StatefulWidget {
  final String question;
  final bool? isSelected;
  final void Function() onYesPressed;
  final void Function() onNoPressed;

  const BinaryChoiceWidget({
    Key? key,
    required this.question,
    required this.onYesPressed,
    required this.onNoPressed,
    this.isSelected,
  }) : super(key: key);

  @override
  State<BinaryChoiceWidget> createState() => _YesNoWidgetFoodPageState();
}

class _YesNoWidgetFoodPageState extends State<BinaryChoiceWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        const SizedBox(
          height: 14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                debugPrint("tapped");
                widget.onYesPressed();
              },
              child: ShadowContainerWidget(
                color: widget.isSelected ?? false
                    ? const Color(0xFF4AB7C3)
                    : Colors.white,
                radius: 10,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 15,
                    width: 75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/ic_checkmark.png",
                          color: widget.isSelected ?? false
                              ? Colors.white
                              : placeHolderTextColor,
                          width: 15,
                          height: 15,
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          "Yes",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: widget.isSelected ?? false
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                widget.onNoPressed();
              },
              child: ShadowContainerWidget(
                color: (widget.isSelected != null ? !widget.isSelected! : false)
                    ? const Color(0xFF4AB7C3)
                    : Colors.white,
                radius: 10,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 75,
                    height: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 15,
                          child: SvgPicture.asset(
                            "assets/images/ic_no.svg",
                            colorFilter: ColorFilter.mode(
                                (widget.isSelected != null
                                        ? !widget.isSelected!
                                        : false)
                                    ? Colors.white
                                    : placeHolderTextColor,
                                BlendMode.srcIn),
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          "No",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: (widget.isSelected != null
                                          ? !widget.isSelected!
                                          : false)
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
