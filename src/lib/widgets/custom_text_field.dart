import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/ui/common/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLines;
  final int? maxLength;
  final Widget? prefix;
  final Widget? suffix;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  final String? errorText;
  final bool autofocus;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;

  const CustomTextField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.maxLines = 1,
    this.maxLength,
    this.prefix,
    this.suffix,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.errorText,
    this.autofocus = false,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: kcTextColorLight,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: maxLines,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          onTap: onTap,
          readOnly: readOnly,
          autofocus: autofocus,
          focusNode: focusNode,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            hintText: hint,
            errorText: errorText,
            prefixIcon: prefix != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: prefix,
                  )
                : null,
            suffixIcon: suffix != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: suffix,
                  )
                : null,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
          ),
        ),
      ],
    );
  }
}
