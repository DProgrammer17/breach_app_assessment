import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/widgets/page_widgets/screen_loader.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AppScaffold extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? appBarContent;
  final Widget? appBarLeadingContent;
  final ShapeBorder? appBarShape;
  final PreferredSizeWidget? appBarBottomContent;
  final Widget? bottomSheet;
  final FloatingActionButton? actionButton;
  final FloatingActionButtonLocation? actionButtonLocation;
  final EdgeInsets? padding;
  final EdgeInsets? bottomPadding;
  final Color? backgroundColor;
  final Color? bottomBackgroundColor;
  final Color? appBackgroundColor;
  final bool centerTile;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final double? toolbarHeight;
  final double? toolbarElevation;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final AlignmentDirectional persistentFooterAlignment;
  final Widget? drawer;
  final DrawerCallback? onDrawerChanged;
  final Widget? endDrawer;
  final DrawerCallback? onEndDrawerChanged;
  final Color? drawerScrimColor;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final String? restorationId;
  final ValueNotifier<bool>? isLoading;

  const AppScaffold({
    super.key,
    this.scaffoldKey,
    this.appBar,
    required this.body,
    this.appBarContent,
    this.appBarLeadingContent,
    this.appBarBottomContent,
    this.appBarShape,
    this.bottomSheet,
    this.actionButton,
    this.actionButtonLocation,
    this.backgroundColor,
    this.appBackgroundColor,
    this.bottomBackgroundColor,
    this.padding,
    this.bottomPadding,
    this.toolbarElevation,
    this.toolbarHeight,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.isLoading,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.centerTile = false,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenLoader(
      isLoading: isLoading ?? ValueNotifier(false),
      child: CupertinoScaffold(
        body: Builder(
          builder: (context) {
            return Scaffold(
              key: scaffoldKey,
              backgroundColor:
                  backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
              extendBody: extendBody,
              extendBodyBehindAppBar: extendBodyBehindAppBar,
              appBar:
                  appBar ??
                  AppBar(
                    toolbarHeight:
                        toolbarHeight ?? AppConstants.size.toolBarHeight,
                    backgroundColor:
                        backgroundColor ?? appBackgroundColor ??
                        Theme.of(context).scaffoldBackgroundColor,
                    automaticallyImplyLeading: false,
                    elevation: toolbarElevation ?? 0,
                    leading: appBarLeadingContent,
                    centerTitle: centerTile,
                    title: appBarContent,
                    bottom: appBarBottomContent,
                    shape: appBarShape,
                  ),
              body: SafeArea(
                child: Padding(
                  padding: padding ?? EdgeInsets.symmetric(horizontal: 20.aw),
                  child: body,
                ),
              ),
              bottomSheet: Padding(
                padding: bottomPadding ?? EdgeInsets.symmetric(horizontal: 20.aw),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      color:
                      bottomBackgroundColor ?? backgroundColor ??
                          Theme.of(context).scaffoldBackgroundColor,
                      child: bottomSheet,
                    ),
                  ],
                ),
              ),
              floatingActionButton: actionButton,
              floatingActionButtonLocation: actionButtonLocation,
              floatingActionButtonAnimator: floatingActionButtonAnimator,
              persistentFooterButtons: persistentFooterButtons,
              //persistentFooterAlignment: persistentFooterAlignment,
              drawer: drawer,
              onDrawerChanged: onDrawerChanged,
              endDrawer: endDrawer,
              onEndDrawerChanged: onEndDrawerChanged,
              drawerScrimColor: drawerScrimColor,
              bottomNavigationBar: bottomNavigationBar,
              resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
              primary: primary,
              drawerDragStartBehavior: drawerDragStartBehavior,
              drawerEdgeDragWidth: drawerEdgeDragWidth,
              drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
              endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
              restorationId: restorationId,
            );
          },
        ),
      ),
    );
  }
}
