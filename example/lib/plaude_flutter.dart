import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PlaudeMessenger extends StatefulWidget {
  final String? token;

  const PlaudeMessenger({super.key, this.token});

  @override
  State<PlaudeMessenger> createState() => _PlaudeMessengerState();
}

class _PlaudeMessengerState extends State<PlaudeMessenger> {
  late final WebViewController _controller;

  @override
  void initState() {
    _controller = WebViewController();
    _controller.loadRequest(
      Uri.parse('https://embed.plaudeai.com/messenger'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${widget.token}',
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
