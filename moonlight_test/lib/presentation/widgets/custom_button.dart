import 'package:flutter/material.dart';
import 'package:moonlight_test/config/theme.dart';
import 'package:moonlight_test/presentation/widgets/circular_progress.dart';
import 'package:moonlight_test/presentation/widgets/show_toast.dart';

enum ButtonType { FLAT, RAISED, BUTTON_ROUND, BUTTON_RRECT }

class CustomButton extends StatefulWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final bool isLoading;
  final String disabledReasonMsg;
  final ButtonType buttonType, shape;
  final bool enabled;
  final BorderRadiusGeometry borderRadius;
  final Function onPressed;
  final Gradient _raisedGradient = LinearGradient(colors: <Color>[
    AppColors.purpleLightHome,
    AppColors.purpleLightHome,
  ]);

  final Gradient _flatGradient =
  LinearGradient(colors: <Color>[AppColors.darkGray, AppColors.darkGray]);

  CustomButton({
    @required this.child,
    @required this.onPressed,
    this.gradient,
    this.width,
    this.height,
    this.borderRadius,
    bool enabled,
    this.buttonType = ButtonType.RAISED,
    this.shape = ButtonType.BUTTON_RRECT,
    this.isLoading = false,
    this.disabledReasonMsg,
  }) : enabled = enabled == null ? true : enabled;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.enabled ? 1 : 0.5,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            shape: widget.shape == ButtonType.BUTTON_ROUND
                ? BoxShape.circle
                : BoxShape.rectangle,
            gradient: widget.gradient == null
                ? widget.buttonType == ButtonType.FLAT
                ? widget._flatGradient
                : widget._raisedGradient
                : widget.gradient,
            boxShadow: widget.buttonType == ButtonType.FLAT
                ? null
                : [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(0.0, 1.5),
                blurRadius: 1.5,
              ),
            ],
            borderRadius: widget.shape == ButtonType.BUTTON_ROUND
                ? null
                : widget.borderRadius == null
                ? BorderRadius.circular(10.0)
                : widget.borderRadius),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              borderRadius: widget.borderRadius == null
                  ? BorderRadius.circular(10.0)
                  : widget.borderRadius,
              onTap: widget.enabled
                  ? widget.onPressed
                  : () {
                if (widget.disabledReasonMsg != null)
                  showToast(msg: widget.disabledReasonMsg);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  widget.isLoading ? showCircleProgress() : widget.child,
                ],
              )),
        ),
      ),
    );
  }
}
