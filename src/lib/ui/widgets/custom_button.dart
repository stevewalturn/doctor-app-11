import 'package:flutter/material.dart';
import 'package:my_app/ui/common/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isOutlined;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: isOutlined
            ? ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: kcPrimaryColor,
                side: const BorderSide(color: kcPrimaryColor),
              )
            : ElevatedButton.styleFrom(
                backgroundColor: backgroundColor ?? kcPrimaryColor,
                foregroundColor: textColor ?? Colors.white,
              ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color:
                      isOutlined ? kcPrimaryColor : (textColor ?? Colors.white),
                ),
              ),
      ),
    );
  }
}
