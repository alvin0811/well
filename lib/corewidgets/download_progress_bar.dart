import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DownloadProgressBar extends StatefulWidget {
  const DownloadProgressBar({
    required this.stream,
    required this.contentLength,
    required this.file,
    required this.onComplete,
    required this.onError,
    Key? key,
  }) : super(key: key);

  final ByteStream stream;
  final int contentLength;
  final File file;
  final VoidCallback onComplete;
  final VoidCallback onError;

  @override
  State<DownloadProgressBar> createState() => _DownloadProgressBarState();
}

class _DownloadProgressBarState extends State<DownloadProgressBar> {
  var progress = 0.0;
  @override
  void initState() {
    super.initState();

    List<int> bytes = [];

    widget.stream.listen(
      (List<int> newBytes) {
        bytes.addAll(newBytes);
        final downloadedLength = bytes.length;
        progress = downloadedLength / widget.contentLength;
        debugPrint(progress.toString());
        setState(() {});
      },
      onDone: () async {
        await widget.file.writeAsBytes(bytes);
        widget.onComplete.call();
      },
      onError: (e) {
        widget.onError.call();
        debugPrint(e);
      },
      cancelOnError: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LinearProgressIndicator(value: progress),
            const SizedBox(height: 16),
            Text(
              '${(progress * 100).toStringAsFixed(0)}%',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
