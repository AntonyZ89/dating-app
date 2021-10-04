import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class ScaleAndFadeTransformer extends PageTransformer {
  final double scale;
  final double fade;

  ScaleAndFadeTransformer({this.fade = 0.3, this.scale = 0.8});

  @override
  Widget transform(Widget item, TransformInfo info) {
    double position = info.position as double;
    double scaleFactor = (1 - position.abs()) * (1 - this.scale);
    double fadeFactor = (1 - position.abs()) * (1 - fade);
    double opacity = fade + fadeFactor;
    double scale = this.scale + scaleFactor;
    return Opacity(
      opacity: opacity,
      child: Transform.scale(
        scale: scale,
        child: item,
      ),
    );
  }
}
