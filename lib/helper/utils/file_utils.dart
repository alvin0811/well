import 'dart:async';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:well_path/corewidgets/download_progress_bar.dart';
import 'package:well_path/widgets/export_csv_report_confirmation_dialog.dart';

class FileUtils {
  static Future<String?> download(String url) async {
    final uri = Uri.parse(url);
    try {
      final response = await http.get(uri);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final imageName = path.basename(uri.path);
        final appDir = await getApplicationDocumentsDirectory();

        final localPath = path.join(appDir.path, imageName);

        final imageFile = File(localPath);
        await imageFile.writeAsBytes(response.bodyBytes);
        return imageFile.path;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<void> downloadFile(
    String url,
    Function(String) downloadComplete,
    VoidCallback onError,
  ) async {
    final request = http.Request('GET', Uri.parse(url));
    final http.StreamedResponse response = await http.Client().send(request);

    final contentLength = response.contentLength ?? 1;

    final imageName = path.basename(Uri.parse(url).path);
    final appDir = (Platform.isIOS)
        ? await getApplicationDocumentsDirectory()
        : await getExternalStorageDirectory();

    final localPath = path.join(appDir!.path, imageName);

    final file = File(localPath);
    BotToast.closeAllLoading();
    BotToast.showLoading(
      wrapToastAnimation: (_, __, ___) => DownloadProgressBar(
          stream: response.stream,
          contentLength: contentLength,
          file: file,
          onComplete: () {
            downloadComplete.call(file.path);
            BotToast.closeAllLoading();
          },
          onError: onError),
      backButtonBehavior: BackButtonBehavior.ignore,
    );
  }
}
