import 'package:audaney/commons/enums.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class SwipeToDismiss extends StatefulWidget {
  final Widget child;
  final Function(double distance)? onSlideUpdate;
  final Function(AnimationDirection? direction)? onSlideOutComplete;
  final bool canDismissVertically;
  final bool canDismissHorizontally;

  const SwipeToDismiss({
    Key? key,
    required this.child,
    this.onSlideUpdate,
    this.onSlideOutComplete,
    this.canDismissVertically = true,
    this.canDismissHorizontally = true,
  }) : super(key: key);

  @override
  _SwipeToDismissState createState() => _SwipeToDismissState();
}

class _SwipeToDismissState extends State<SwipeToDismiss> with TickerProviderStateMixin {
  bool positionInitialized = false;
  RenderBox? box;
  Rect? screenBounds;
  Offset widgetOffset = const Offset(0.0, 0.0);
  Tween<Offset>? slideOutTween;
  Offset? dragStart, dragPosition, slideResetPosition, topLeft, bottomRight;
  AnimationDirection? slideOutDirection;
  AnimationController? slideInAnimator, slideOutAnimator;

  @override
  void initState() {
    super.initState();
    slideInAnimator = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )
      ..addListener(() => setState(() {
            widgetOffset = Offset.lerp(
              slideResetPosition,
              const Offset(0.0, 0.0),
              Curves.elasticOut.transform(slideInAnimator?.value ?? 0.00),
            )!;

            if (null != widget.onSlideUpdate) {
              widget.onSlideUpdate!(widgetOffset.distance);
            }

          }))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            dragStart = null;
            slideResetPosition = null;
            dragPosition = null;
          });
        }
      });

    slideOutAnimator = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )
      ..addListener(() {
        setState(() {
          widgetOffset = slideOutTween!.evaluate(slideOutAnimator!);

          if (null != widget.onSlideUpdate) {
            widget.onSlideUpdate!(widgetOffset.distance);
          }

        });
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            dragStart = null;
            dragPosition = null;
            slideOutTween = null;

            if (widget.onSlideOutComplete != null) {
              widget.onSlideOutComplete!(slideOutDirection);
            }else{
              Navigator.pop(context);
            }
          });
        }
      });
  }

  @override
  void dispose() {
    slideInAnimator?.dispose();
    super.dispose();
  }

  double _rotation(Rect? dragBounds) {
    if (dragStart != null) {
      final rotationCornerMultiplier =
          dragStart!.dy >= dragBounds!.top + (dragBounds.height / 2) ? -1 : 1;
      return (pi / 8) *
          (widgetOffset.dx / dragBounds.width) *
          rotationCornerMultiplier;
    } else {
      return 0.0;
    }
  }

  Offset _rotationOrigin(Rect? dragBounds) {
    if (dragStart != null) {
      return dragStart! - dragBounds!.topLeft;
    } else {
      return const Offset(0.0, 0.0);
    }
  }

  void _onPanStart(DragStartDetails details) {
    dragStart = details.globalPosition;

    if (slideInAnimator?.isAnimating ?? false) {
      slideInAnimator!.stop(canceled: true);
    }
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      dragPosition = details.globalPosition;
      widgetOffset = dragPosition! - dragStart!;

      if (null != widget.onSlideUpdate) {
        widget.onSlideUpdate!(widgetOffset.distance);
      }

    });
  }

  void _onPanEnd(DragEndDetails details) {
    final currentPosition = widgetOffset / widgetOffset.distance;

    final left = (widgetOffset.dx / context.size!.width) < -0.15;
    final right = (widgetOffset.dx / context.size!.width) > 0.15;
    final top = (widgetOffset.dy / context.size!.height) < -0.15;
    final bottom = (widgetOffset.dy / context.size!.height) > 0.15;

    Tween<Offset> tween = Tween(
        begin: widgetOffset,
        end: currentPosition *
            (2 *
                ((top || bottom)
                    ? context.size!.height
                    : context.size!.width)));

    setState(() {
      if (left || right) {
        if (widget.canDismissHorizontally) {
          slideOutTween = tween;
          slideOutAnimator?.forward(from: 0.0);
          slideOutDirection = left ? AnimationDirection.left : AnimationDirection.right;
        } else {
          slideResetPosition = widgetOffset;
          slideInAnimator?.forward(from: 0.0);
        }
      } else if (top || bottom) {
        if (widget.canDismissVertically) {
          slideOutTween = tween;
          slideOutAnimator?.forward(from: 0.0);
          slideOutDirection = top ? AnimationDirection.up : AnimationDirection.bottom;
        } else {
          slideResetPosition = widgetOffset;
          slideInAnimator?.forward(from: 0.0);
        }
      } else {
        slideResetPosition = widgetOffset;
        slideInAnimator?.forward(from: 0.0);
      }

    });
  }

  _initializePositions() async {
    await Future.delayed(const Duration(milliseconds: 3));
    box = context.findRenderObject() as RenderBox?;
    topLeft = box!.size.topLeft(box!.localToGlobal(const Offset(0.0, 0.0)));
    bottomRight =
        box!.size.bottomRight(box!.localToGlobal(const Offset(0.0, 0.0)));
    screenBounds = Rect.fromLTRB(
      topLeft?.dx ?? 0.00,
      topLeft?.dy ?? 0.00,
      bottomRight?.dx ?? 0.00,
      bottomRight?.dy ?? 0.00,
    );

    setState(() {
      positionInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool canPan = widget.canDismissVertically || widget.canDismissHorizontally;

    if (!positionInitialized) {
      _initializePositions();
    }

    return Transform(
      transform:
          Matrix4.translationValues(widgetOffset.dx, widgetOffset.dy, 0.0)
            ..rotateZ(_rotation(screenBounds)),
      origin: _rotationOrigin(screenBounds),
      child: Container(
        width: screenBounds?.width ?? size.width,
        height: screenBounds?.height ?? size.height,
        padding: EdgeInsets.zero,
        child: GestureDetector(
          onPanStart: canPan ? _onPanStart : null,
          onPanUpdate: canPan ? _onPanUpdate : null,
          onPanEnd: canPan ? _onPanEnd : null,
          child: widget.child,
        ),
      ),
    );
  }

}
