import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:well_path/corewidgets/custom_container_widget.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Widget? errorWidget;
  final Widget? placeHolderWidget;
  final Widget Function(BuildContext, ImageProvider<Object>?)? imageBuilder;

  const AppNetworkImage(
    this.url, {
    this.height,
    this.width,
    this.fit,
    this.errorWidget,
    this.placeHolderWidget,
    this.imageBuilder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (inValidUrl) {
      return SizedBox(
        width: width,
        height: height,
        child: errorWidget ?? const _ImageError(),
      );
    }
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width,
      placeholder: (_, __) => placeHolderWidget ?? const _PlaceHolder(),
      errorWidget: (_, ___, __) => errorWidget ?? const _ImageError(),
      imageBuilder: imageBuilder,
    );
  }

  bool get inValidUrl {
    return !url.startsWith('https://') && !url.startsWith('http://');
  }
}

class _PlaceHolder extends StatefulWidget {
  const _PlaceHolder({Key? key}) : super(key: key);

  @override
  State<_PlaceHolder> createState() => __PlaceHolderState();
}

class __PlaceHolderState extends State<_PlaceHolder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation gradientPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    gradientPosition = Tween<double>(
      begin: -3,
      end: 10,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    _controller
      ..addListener(() => setState(() {}))
      ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(gradientPosition.value, 0),
          end: const Alignment(-1, 0),
          colors: const [
            Color(0xFFEBEBF4),
            Color(0xFFF4F4F4),
            Color(0xFFEBEBF4),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _ImageError extends StatelessWidget {
  const _ImageError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadowContainerWidget(
      height: double.infinity,
      radius: 20,
      color: Colors.white70,
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
