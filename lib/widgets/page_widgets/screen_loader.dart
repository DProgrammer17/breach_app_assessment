import 'dart:ui';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ScreenLoader extends StatelessWidget{
  const ScreenLoader({
    super.key,
    required this.isLoading,
    required this.child,
  });
  final ValueNotifier<bool> isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            const begin = Offset(0.0, 1.0);
            const end = Offset(0.0, -1.0);
            const curve = Curves.ease;

            final tween = Tween(begin: begin, end: end);
            final curvedAnimation =
            CurvedAnimation(parent: animation, curve: curve);

            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          },
          layoutBuilder: (_, children) {
            return ValueListenableBuilder<bool>(
              valueListenable: isLoading,
              builder: (context, bool loading, _) {
                if (loading) return const BackgroundLoader();
                return const SizedBox.shrink();
              },
            );
          },
        ),
      ],
    );
  }
}

class BackgroundLoader extends StatelessWidget{
  const BackgroundLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.neutralGrey.withOpacity(0.5),
                  AppColors.neutralGrey.withOpacity(0.2)
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
            ),
          ),
        ),
        const Center(
          child: Loader(),
        ),
      ],
    );
  }

}

class Loader extends StatelessWidget{
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: AppColors.primaryPurple600,
      strokeWidth: 4.ar,
    );
  }

}