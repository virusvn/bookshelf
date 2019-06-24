import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/magazine.dart';

class MagazineScreen extends StatelessWidget {
  final Magazine magazine;
  const MagazineScreen({Key key, @required this.magazine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: magazine.url),
    );
  }
}
