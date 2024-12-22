import 'package:flutter/material.dart';
import 'package:my_app/ui/common/app_colors.dart';

enum ButtonType { primary, secondary, text }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.isLoading = false,
    this.isFullWidth = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ButtonType.primary:
        return _PrimaryButton(
          text: text,
          onPressed: onPressed,
          isLoading: isLoading,
          isFullWidth: isFullWidth,
          icon: icon,
        );
      case ButtonType.secondary:
        return _SecondaryButton(
          text: text,
          onPressed: onPressed,
          isLoading: isLoading,
          isFullWidth: isFullWidth,
          icon: icon,
        );
      case ButtonType.text:
        return _TextButton(
          text: text,
          onPressed: onPressed,
          isLoading: isLoading,
          icon: icon,
        );
    }
  }
}

class _PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? icon;

  const _PrimaryButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isFullWidth = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kcPrimaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: _ButtonContent(
          text: text,
          isLoading: isLoading,
          icon: icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? icon;

  const _SecondaryButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isFullWidth = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: kcPrimaryColor),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: _ButtonContent(
          text: text,
          isLoading: isLoading,
          icon: icon,
          color: kcPrimaryColor,
        ),
      ),
    );
  }
}

class _TextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final IconData? icon;

  const _TextButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isLoading ? null : onPressed,
      child: _ButtonContent(
        text: text,
        isLoading: isLoading,
        icon: icon,
        color: kcPrimaryColor,
      ),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  final String text;
  final bool isLoading;
  final IconData? icon;
  final Color color;

  const _ButtonContent({
    required this.text,
    required this.isLoading,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(text),
        ],
      );
    }

    return Text(text);
  }
}
