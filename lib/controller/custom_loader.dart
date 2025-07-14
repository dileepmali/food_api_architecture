import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoader extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final bool isLoading;
  final Widget? child;

  const CustomLoader({
    Key? key,
    this.width = double.infinity,
    this.height = 16,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.isLoading = true,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isLoading && child != null) {
      return child!;
    }
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
