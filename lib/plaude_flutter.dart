library plaude_flutter;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class _PlaudeMessenger extends StatefulWidget {
  final String appId;
  final String? token;

  const _PlaudeMessenger({
    required this.appId,
    this.token,
  });

  @override
  State<_PlaudeMessenger> createState() => _PlaudeMessengerState();
}

class _PlaudeMessengerState extends State<_PlaudeMessenger> {
  late final WebViewController _controller;

  @override
  void initState() {
    _controller = WebViewController();
    _controller.loadRequest(
      Uri.parse(
        'https://embed.plaudeai.com/messenger/${widget.appId}${widget.token != null ? '&token=${widget.token}' : ''}',
      ),
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

void openMessenger({
  required BuildContext context,
  required String appId,
  String? token,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) {
      return _PlaudeMessenger(
        appId: appId,
        token: token,
      );
    },
  );
}
