import 'package:flutter/material.dart';
import 'package:qaf_store/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:qaf_store/common/widgets/qaf_circular_container.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';

class PrimaryHeaderWidget extends StatelessWidget {
  final Widget child;
  const PrimaryHeaderWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: QafColors.primary,
        padding: EdgeInsets.all(0),
        child: Stack(
            children: [
              PositionedDirectional(
                top: -150,
                end: -250,
                child: QafCircularContainer(
                    color: QafColors.white.withValues(alpha: .1)),
              ),
              PositionedDirectional(
                top: 100,
                end: -300,
                child: QafCircularContainer(
                    color: QafColors.white.withValues(alpha: .1)),
              ),
              child,
            ],
          ),
      ),
    );
  }
}
