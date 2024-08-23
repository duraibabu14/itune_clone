import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ituneclone/utils/color_resource.dart';

class CustomScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Color color;
  final bool isBottomReSize;
  final bool fullScreen;
  final Widget? bottomBar;
  final Widget? floatingActionButton;
  final Key? globalKey;
  final Widget? drawer;
  final Color? statusColor;
  final SafeAreaValues? safeAreaValues;
  final bool extendBody;
  final SystemUiOverlayStyle? appBarBottombarSettings;
  const CustomScaffold({
    super.key,
    this.appBar,
    this.body,
    this.bottomBar,
    this.color = ColorResource.color000000,
    this.drawer,
    this.globalKey,
    this.extendBody = false,
    this.floatingActionButton,
    this.appBarBottombarSettings,
    this.isBottomReSize = true,
    this.safeAreaValues,
    this.fullScreen = true,
    this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: appBarBottombarSettings ??
            SystemUiOverlayStyle(
              statusBarColor: statusColor ?? ColorResource.color000000,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarIconBrightness: Brightness.light,
              systemNavigationBarColor: ColorResource.color000000,
              systemNavigationBarDividerColor: ColorResource.color000000,
            ),
        child: Scaffold(
            key: globalKey,
            extendBody: extendBody,
            resizeToAvoidBottomInset: isBottomReSize,
            backgroundColor: color,
            appBar: appBar,
            floatingActionButton: floatingActionButton,
            drawer: drawer,
            bottomNavigationBar: bottomBar,
            body: _buildBody(context, color)));
  }

  Widget _buildBody(BuildContext context, Color color) {
    if (fullScreen) {
      return _buildChild(context);
    } else {
      return SafeArea(
        bottom: safeAreaValues?.isBottomSafeArea ?? true,
        child: _buildChild(context),
      );
    }
  }

  Widget _buildChild(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: body,
    );
  }
}

class SafeAreaValues {
  bool isBottomSafeArea;
  SafeAreaValues({this.isBottomSafeArea = true});
}
