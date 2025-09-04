import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef SlotBuilder = Widget Function(
    BuildContext context, BoxConstraints constraints);

class SlotWidget extends StatelessWidget {
  const SlotWidget({
    super.key,
    this.mobileSlot,
    this.tabletSlot,
    this.desktopSlot,
  }) : assert(
  mobileSlot != null || tabletSlot != null || desktopSlot != null,
  'Mobile, tablet and desktop slot cannot be null',
  );

  final SlotBuilder? mobileSlot;
  final SlotBuilder? tabletSlot;
  final SlotBuilder? desktopSlot;

  @override
  Widget build(BuildContext context) {
    final constraints = BoxConstraints(
      maxWidth: MediaQuery.sizeOf(context).width,
      maxHeight: MediaQuery.sizeOf(context).height,
    );

    return AnimatedSwitcher(
      switchInCurve: Curves.easeIn,
      duration: const Duration(milliseconds: 100),
      child: () {
        if (context.isMobile) {
          return mobileSlot?.call(context, constraints) ??
              const _NoneSupportedSlot('Mobile');
        } else if (context.isTablet) {
          return tabletSlot?.call(context, constraints) ??
              const _NoneSupportedSlot('Tablet');
        } else {
          return desktopSlot?.call(context, constraints) ??
              const _NoneSupportedSlot('Desktop');
        }
      }(),
    );
  }
}

class _NoneSupportedSlot extends StatelessWidget {
  const _NoneSupportedSlot(this.slotName);

  final String slotName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppConstants.size.horizontalPadding - 12),
          child: Text(
            '$slotName screen size is not supported',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: Theme.of(context).colorScheme.tertiary),
          ),
        ),
      ),
    );
  }
}


extension BuildContextX on BuildContext {
  bool get _isMobile {
    return defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android;
  }

  bool get _isTablet {
    final orientation = MediaQuery.of(this).orientation;
    return (orientation == Orientation.landscape &&
        MediaQuery.sizeOf(this).height >= 600);
  }

  bool get _isDesktop {
    final orientation = MediaQuery.of(this).orientation;
    return (orientation == Orientation.landscape &&
        MediaQuery.sizeOf(this).height >= 1300);
  }

  bool get isMobile {
    return _isMobile && !_isTablet;
  }

  bool get isTablet {
    return _isTablet;
  }

  bool get isDesktop {
    return _isDesktop;
  }
}