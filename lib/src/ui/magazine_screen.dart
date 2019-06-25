import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/magazine.dart';

class MagazineScreen extends StatelessWidget {
  final Magazine magazine;
  WebViewController _controller;
  MagazineScreen({Key key, @required this.magazine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: magazine.url,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
      ),
      Positioned(
        child: FloatingActionButton.extended(
          label: Icon(Icons.arrow_back),
          onPressed: () {
            _controller.goBack();
          },
        ),
        right: 40,
        bottom: 40,
      )
    ]);
  }
}
