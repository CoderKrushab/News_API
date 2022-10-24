import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final GlobalKey inAppWebViewKey = GlobalKey();
  InAppWebViewController? inAppWebViewController;
  double progress = 0;
  String url = "";
  late PullToRefreshController pullToRefreshController;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: true,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsAirPlayForMediaPlayback: true,
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pullToRefreshController = PullToRefreshController(
        options: PullToRefreshOptions(),
        onRefresh: () async {
          if (Platform.isAndroid) {
            inAppWebViewController?.reload();
          } else if (Platform.isIOS) {
            inAppWebViewController?.loadUrl(
              urlRequest: URLRequest(
                url: await inAppWebViewController?.getUrl(),
              ),
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 30,
          ),
        ),
        actions: const [
          Icon(
            Icons.newspaper,
            color: Colors.white,
            size: 30,
          ),
        ],
        title: const Text(
          "SK NEWS",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Column(
        children: [
          progress < 1.0
              ? LinearProgressIndicator(
                  value: progress,
                  color: Colors.black,
                  minHeight: 6,
                )
              : Container(),
          Expanded(
            flex: 15,
            child: InAppWebView(
              initialOptions: options,
              key: inAppWebViewKey,
              initialUrlRequest: URLRequest(
                url: Uri.parse("$res"),
              ),
              onWebViewCreated: (controller) {
                inAppWebViewController = controller;
              },
              onProgressChanged: (controller, progress) {
                if (progress == 100) {
                  pullToRefreshController.endRefreshing();
                }
                setState(() {
                  this.progress = progress / 100;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
