import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  String url;
  String title;

  WebViewScreen({super.key, required this.url, required this.title});

  @override
  State<WebViewScreen> createState() => _WebViewScreenPageState();
}

class _WebViewScreenPageState extends State<WebViewScreen> {
  bool isLoading = true; // Track loading state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onProgress: (int progress) {
              if (progress > 50) {
                setState(() {
                  isLoading = false; // Page has finished loading
                });
              }
              print("WebView is loading (progress : $progress%)");
            },
          ),
          isLoading ? Center(child: CircularProgressIndicator()) : Container(),
          // Show loader if loading
        ],
      ),
    );
  }
}
