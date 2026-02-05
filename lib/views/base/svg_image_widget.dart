import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A reusable widget for displaying SVG images
///
/// Supports both asset and network SVG images with customizable properties
class SvgImageWidget extends StatelessWidget {
  /// Path to the SVG asset or URL for network images
  final String path;

  /// Width of the SVG image
  final double? width;

  /// Height of the SVG image
  final double? height;

  /// Color to apply to the SVG (overrides original colors)
  final Color? color;

  /// How the image should be inscribed into the space
  final BoxFit fit;

  /// Alignment of the image within its bounds
  final Alignment alignment;

  /// Whether to use semantics label for accessibility
  final String? semanticsLabel;

  /// Whether the SVG is from network (URL) or asset
  final bool isNetwork;

  /// Placeholder widget while loading network images
  final Widget? placeholder;

  /// Error widget if the SVG fails to load
  final Widget? errorWidget;

  const SvgImageWidget({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.semanticsLabel,
    this.isNetwork = false,
    this.placeholder,
    this.errorWidget,
  });

  /// Constructor for asset SVG images
  const SvgImageWidget.asset(
    String assetPath, {
    Key? key,
    double? width,
    double? height,
    Color? color,
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    String? semanticsLabel,
  }) : this(
         key: key,
         path: assetPath,
         width: width,
         height: height,
         color: color,
         fit: fit,
         alignment: alignment,
         semanticsLabel: semanticsLabel,
         isNetwork: false,
       );

  /// Constructor for network SVG images
  const SvgImageWidget.network(
    String url, {
    Key? key,
    double? width,
    double? height,
    Color? color,
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    String? semanticsLabel,
    Widget? placeholder,
    Widget? errorWidget,
  }) : this(
         key: key,
         path: url,
         width: width,
         height: height,
         color: color,
         fit: fit,
         alignment: alignment,
         semanticsLabel: semanticsLabel,
         isNetwork: true,
         placeholder: placeholder,
         errorWidget: errorWidget,
       );

  @override
  Widget build(BuildContext context) {
    if (isNetwork) {
      return SvgPicture.network(
        path,
        width: width ?? 24.w,
        height: height ?? 24.h,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
        fit: fit,
        alignment: alignment,
        semanticsLabel: semanticsLabel,
        placeholderBuilder: placeholder != null
            ? (context) => placeholder!
            : (context) => const Center(child: CircularProgressIndicator()),
      );
    }

    return SvgPicture.asset(
      path,
      width: width ?? 24.w,
      height: height ?? 24.h,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
      fit: fit,
      alignment: alignment,
      semanticsLabel: semanticsLabel,
    );
  }
}

/// Example usage widget demonstrating different ways to use SvgImageWidget
class SvgImageExample extends StatelessWidget {
  const SvgImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SVG Image Widget Example')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Example 1: Asset SVG with custom size
            SvgImageWidget.asset(
              'assets/icons/flutter_logo.svg',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),

            // Example 2: Asset SVG with color override
            SvgImageWidget.asset(
              'assets/icons/flutter_logo.svg',
              width: 80,
              height: 80,
              color: Colors.blue,
            ),
            SizedBox(height: 20),

            // Example 3: Network SVG
            SvgImageWidget.network(
              'https://www.svgrepo.com/show/353911/flutter.svg',
              width: 120,
              height: 120,
              placeholder: CircularProgressIndicator(),
            ),
            SizedBox(height: 20),

            // Example 4: Using main constructor
            SvgImageWidget(
              path: 'assets/icons/logo.svg',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
              semanticsLabel: 'Company Logo',
            ),
          ],
        ),
      ),
    );
  }
}
