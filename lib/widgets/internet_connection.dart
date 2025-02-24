import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class InternetConnection extends StatelessWidget {
  const InternetConnection._({required this.connected, Key? key})
      : super(key: key);

  final bool connected;

  static bool showBanner = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: connected ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  !connected
                      ? Icons.signal_wifi_connected_no_internet_4_rounded
                      : Icons.done,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  connected ? 'Internet connected' : 'No internet connection',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static void show(bool connected) {
    if (!showBanner) {
      return;
    }
    hide();
    BotToast.showLoading(
      wrapToastAnimation: (_, __, ___) =>
          InternetConnection._(connected: connected),
      backButtonBehavior: BackButtonBehavior.ignore,
      allowClick: true,
      backgroundColor: Colors.transparent,
    );
    Future.delayed(const Duration(seconds: 5), hide);
  }

  static void hide() {
    BotToast.closeAllLoading();
  }
}
