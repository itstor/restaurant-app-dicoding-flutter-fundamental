import 'package:flutter/material.dart';
import '../common/constants.dart';

class NeumorphicSingleButtonWidget extends StatefulWidget {
  final Widget? child;
  final double borderRadius;
  final VoidCallback onTap;
  const NeumorphicSingleButtonWidget({
    Key? key,
    this.child,
    this.borderRadius = 15,
    required this.onTap,
  }) : super(key: key);

  @override
  State<NeumorphicSingleButtonWidget> createState() =>
      _NeumorphicSingleButtonWidgetState();
}

class _NeumorphicSingleButtonWidgetState
    extends State<NeumorphicSingleButtonWidget> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        widget.onTap();
        setState(() {
          isClicked = true;
        });
      },
      onPointerUp: (event) {
        setState(() {
          isClicked = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: isClicked
              ? LinearGradient(
                  colors: [
                    Colors.grey[200]!,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: [
            BoxShadow(
              color: kGrayColor[80]!.withOpacity(0.25),
              spreadRadius: 0.0,
              blurRadius: 30.0,
              offset: const Offset(0.0, 15.0),
            )
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
