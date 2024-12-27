import 'dart:ui';

import 'package:flutter/material.dart';

class TransformedItem extends StatelessWidget {
  const TransformedItem({
    super.key,
    required this.index,
    required this.factorChange,
    required this.startScale,
    required this.endScale,
    required this.startXTranslate,
    required this.endXTranslate,
    required this.startYTranslate,
    required this.endYTranslate,
    required this.child,
  });

  final int index;
  final double factorChange;
  final double startScale;
  final double endScale;
  final double startXTranslate;
  final double endXTranslate;
  final double startYTranslate;
  final double endYTranslate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Transform.translate(
        offset: Offset(
          lerpDouble(startXTranslate, endXTranslate, factorChange)!,
          lerpDouble(startYTranslate, endYTranslate, factorChange)!,
        ),
        child: Transform.scale(
          scale: lerpDouble(startScale, endScale, factorChange)!,
          child: child,
        ),
      ),
    );
  }
}
