import 'package:flutter/material.dart';

// Widget pour afficher un sous élément avec des bords arrondis
// angle à préciser ou par défaut
class RoundedDisplay extends StatelessWidget {
  final Widget child;
  final double radius;

  const RoundedDisplay({super.key, required this.child, this.radius = 30});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: BorderRadius.circular(radius), child: child);
  }
}
