import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            showDialog(
                context: context,
                builder: (context) {
                  return Text(error.description);
                });
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('http://myredirect')) {
              // grab auth code
              log("code: ${request.url}");
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'http://localhost:8080/realms/dev/protocol/openid-connect/auth?client_id=myclient&redirect_uri=http%3A%2F%2Fmyredirect%3A8080%2F&response_type=code'));
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Simple Example')),
      body: WebViewWidget(controller: controller),
    );
  }
}
