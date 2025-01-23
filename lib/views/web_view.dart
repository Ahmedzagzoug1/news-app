import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});
  static const String id = '/web_view';

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  double progress = 0;
  late InAppWebViewController _controller;

  @override
  Widget build(BuildContext context) {
    final String url = ModalRoute.of(context)!.settings.arguments as String;

    return PopScope(
      canPop: true,
      onPopInvoked: (popInvoked) {},
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(url: WebUri(url)),
                initialSettings: InAppWebViewSettings(
                    allowsBackForwardNavigationGestures: true),
                onWebViewCreated: (controller) {
                  _controller = controller;
                },
                onReceivedError: (_controller, result, error) {
                  print('$error');
                },
              
              ),
            )
          ],
        ),
      ),
    );
  }

  popInvoked(didPop, result) async {
    final webController = _controller;
    if (await webController.canGoBack()) {
      webController.goBack();
    }
  }
}
