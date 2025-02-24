import 'package:flutter/material.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';

mixin Message {
  void initMessageListener(
    Stream<CubitMessage> messageStream,
    BuildContext context,
  ) {
    messageStream.listen((event) {
      event.map(
        local: (local) => context.showSnackBar(
          local.message.toLocalizedString(context)!,
        ),
        network: (network) => context.showSnackBar(network.message,
            isError: network.isError ?? true),
      );
    });
  }
}
