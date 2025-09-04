import 'package:breach_assessment/widgets/utility_widgets/textfield/ios_done_button_overlay.dart';
import 'package:flutter/cupertino.dart';
class KeyboardOverlay {
  static OverlayEntry? _overlayEntry;

  static showOverlay(BuildContext context,
      {VoidCallback? upButtonPressed,
        VoidCallback? downButtonPressed,
        VoidCallback? onDonePress}) {
    if (_overlayEntry != null) {
      return;
    }

    OverlayState? overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          right: 0.0,
          left: 0.0,
          child: InputDoneView(
            upButtonPressed: upButtonPressed,
            downButtonPressed: downButtonPressed,
            onDonePress: onDonePress,
          ),
        );
      },
    );

    overlayState.insert(_overlayEntry!);
  }

  static removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}