import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/shared/presentation/base_page.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_dimensions.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class QuestionDetailPage extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String uri;

  const QuestionDetailPage({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.uri,
  });

  @override
  State<QuestionDetailPage> createState() => _QuestionDetailPageState();
}

class _QuestionDetailPageState extends State<QuestionDetailPage> {
  late final WebViewController _controller;
  bool _isLoading = true;
  double _loadingProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              _loadingProgress = progress / 100;
            });
          },
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('WebView error: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.uri));
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      useSafeArea: true,
      body: Column(
        children: [
          Hero(
            tag: 'question_${widget.uri}',
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                height: AppDimensions.height200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(widget.imageUrl), fit: BoxFit.cover),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.3),
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                      stops: const [0.0, 0.3, 0.6, 1.0],
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Back Button
                      SafeArea(
                        child: Padding(
                          padding: EdgeInsets.all(AppDimensions.padding8),
                          child: IconButton(
                            onPressed: () => context.router.maybePop(),
                            icon: Container(
                              padding: EdgeInsets.all(AppDimensions.padding8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                color: AppColors.lightTextPrimary,
                                size: AppDimensions.icon20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 140.h,
                        left: 14.w,
                        right: 14.w,
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                            shadows: const [
                              Shadow(offset: Offset(0, 1), blurRadius: 3, color: Colors.black45),
                            ],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          if (_isLoading)
            LinearProgressIndicator(
              value: _loadingProgress,
              backgroundColor: AppColors.lightDivider,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),

          Expanded(child: WebViewWidget(controller: _controller)),
        ],
      ),
    );
  }
}
