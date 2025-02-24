import 'package:flutter/material.dart';
import 'package:qaf_store/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class CurvedEdgeWidget extends StatelessWidget {
  final Widget child;
  const CurvedEdgeWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: QafCustomCurvedEdges(),
      child: child,
    );
  }
}