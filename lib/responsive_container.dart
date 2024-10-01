import 'package:flutter/material.dart';

class ResponsiveContainer extends StatelessWidget {
  final Widget child;

  const ResponsiveContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double containerWidth =
          constraints.maxWidth > 327 ? 327 : constraints.maxWidth;
      return Container(
        constraints: BoxConstraints(maxWidth: containerWidth),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: child,
      );
    });
  }
}
