import 'package:dataflows_assessment/app/assets/exporter/importer_app_general.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
    this.buttonText,
    this.onPressed, {
    super.key,
    this.buttonStyle = PrimaryButtonType.filled,
    this.hasBorderSide = false,
    this.textColor,
    this.backgroundColor,
    this.buttonMargin,
    this.borderColor,
    this.hasConstraint,
    this.borderRadius,
    this.enabled = true,
    this.buttonTextStyle,
    this.padding = const EdgeInsets.all(14),
    this.fontSize = 16,
    this.leadingWidget,
    this.leadingSpacing = 8,
  });

  final String? buttonText;
  final PrimaryButtonType buttonStyle;
  final bool hasBorderSide;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsets? buttonMargin;
  final VoidCallback? onPressed;
  final bool? hasConstraint;
  final double? borderRadius;
  final bool enabled;
  final TextStyle? buttonTextStyle;
  final EdgeInsets padding;
  final double fontSize;
  final Widget? leadingWidget;
  final double? leadingSpacing;

  @override
  Widget build(BuildContext context) {
    final bool isFilled = buttonStyle == PrimaryButtonType.filled;
    final bool isOutlined = buttonStyle == PrimaryButtonType.outlined;

    return TouchableOpacity(
      onPressed: enabled ? onPressed : null,
      child: Container(
        margin: buttonMargin,
        padding: padding,
        constraints: hasConstraint == true ? null : const BoxConstraints(minWidth: double.infinity),
        decoration: BoxDecoration(
          border: hasBorderSide
              ? Border.all(
                  color: isOutlined
                      ? borderColor ?? Colors.purple.shade500
                      : isFilled
                      ? Colors.transparent
                      : Colors.purple.shade500,
                )
              : null,
          color: enabled
              ? isFilled
                    ? backgroundColor ?? Colors.purple.shade500
                    : (isOutlined ? Colors.white : Colors.transparent)
              : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(borderRadius ?? 26),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leadingWidget != null) ...[leadingWidget!, SizedBox(width: leadingSpacing)],
            Text(
              buttonText ?? '',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style:
                  buttonTextStyle ??
                  TextStyle(
                    color: enabled
                        ? (isOutlined ? Colors.purple.shade500 : Colors.white)
                        : Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: fontSize,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
