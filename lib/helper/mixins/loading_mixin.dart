import 'package:flutter/material.dart';
import 'package:well_path/widgets/loading_dialog.dart';

mixin Loading {
  void initLoadingListener(
    Stream<bool> loaderStream,
    BuildContext context,
  ) {
    loaderStream.listen((event) {
      if (event) {
        LoadingDialog.show(context);
        return;
      }
      LoadingDialog.hide(context);
    });
  }
}
