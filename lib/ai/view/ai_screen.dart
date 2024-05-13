import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mosaico/common/component/custom_loading.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AiScreen extends StatefulWidget {
  static String get routeName => "ai";

  const AiScreen({super.key});

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  late final WebViewController controller;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(MyColor.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            print('onProgress: ${progress}');
          },
          onPageStarted: (String url) {
            print('onPageStarted: ${url}');
            setState(() {
              isVisible = false;
            });
          },
          onPageFinished: (String url) {
            print('onPageFinished: ${url}');
            setState(() {
              isVisible = true;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.mozaico.site/creator'));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: 'AI 이벤트 제작'),
      child: isVisible
          ? WebViewWidget(controller: controller)
          : CustomLoadingScreen(),
    );
  }
}
