import 'package:flutter/material.dart';

dynamic returnPerfectMode({required dynamic dark, required dynamic light, required ThemeMode themeMode})
  => (themeMode == ThemeMode.light) ? light : dark;

bool isScrollInRange({required ScrollController scrollController, required bool isInRange, double? offsetPadding}) {
  if (scrollController.offset <= scrollController.position.minScrollExtent &&
      !scrollController.position.outOfRange) {
    return true;
  } else {
    if (scrollController.offset > (offsetPadding ?? 5) && isInRange) {
      return false;
    }
  }
  return isInRange;
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
