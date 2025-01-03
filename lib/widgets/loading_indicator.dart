import 'package:flutter/material.dart';

/// A simple, centered circular progress indicator.
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

/// A more customizable circular progress indicator.
class CustomLoadingIndicator extends StatelessWidget {
  /// The width of the circle's stroke.
  final double? strokeWidth;

  /// The color of the progress indicator.
  final Color? color;

  /// The value of the progress indicator.
  ///
  /// If [value] is non-null, the progress indicator is shown in a
  /// determinate state with the given [value].
  ///
  /// If [value] is null, the progress indicator is shown in an
  /// indeterminate state, drawing an animation.
  final double? value;

  /// The progress indicator's color as an animated value.
  ///
  /// If null, the progress indicator uses the theme's [ColorScheme.primary].
  ///
  /// If non-null, the progress indicator is animated using the given [Animation].
  /// If this animation is always the same value, then the progress indicator
  /// will be a solid color. If the animation changes values, it will
  /// animate between the different colors in the animation.
  final Animation<Color?>? valueColor;

  const CustomLoadingIndicator({
    super.key,
    this.strokeWidth,
    this.color,
    this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 4.0, // Default stroke width
        color: color,
        value: value,
        valueColor: valueColor,
      ),
    );
  }
}

/// A linear loading indicator
class LinearLoadingIndicator extends StatelessWidget {
  /// The value of the progress indicator.
  ///
  /// If [value] is non-null, the progress indicator is shown in a
  /// determinate state with the given [value].
  ///
  /// If [value] is null, the progress indicator is shown in an
  /// indeterminate state, drawing an animation.
  final double? value;

  /// The progress indicator's background color. The current theme's
  /// `canvasColor` is used by default.
  final Color? backgroundColor;

  /// The color of the progress indicator.
  ///
  /// If null, the progress indicator uses the theme's [ColorScheme.primary].
  final Animation<Color?>? valueColor;
  const LinearLoadingIndicator({super.key, this.value, this.backgroundColor, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: backgroundColor,
      valueColor: valueColor,
    );
  }
}