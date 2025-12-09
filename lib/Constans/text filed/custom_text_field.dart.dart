import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final int maxLines;
  final int minLines;
  final Widget? suffixWidget;
  final VoidCallback? onSuffixTap;
  final ValueChanged<String>? onChanged;
  final bool enabled;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.suffixWidget,
    this.onSuffixTap,
    this.onChanged,
    required this.enabled,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// LABEL
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: colors.onBackground,  // 🔥 Theme aware
            letterSpacing: 0.3,
          ),
        ),

        const SizedBox(height: 8),

        /// TEXT FIELD CONTAINER (SHADOW)
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: _isFocused
                    ? colors.primary.withOpacity(0.2)
                    : colors.shadow.withOpacity(0.05),
                blurRadius: _isFocused ? 12 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),

          /// TEXTFIELD
          child: TextFormField(
            enabled: widget.enabled,
            controller: widget.controller,
            focusNode: _focusNode,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            onChanged: widget.onChanged,
            validator: widget.validator,

            decoration: InputDecoration(
              hintText: widget.hintText,

              /// HINT TEXT COLOR
              hintStyle: TextStyle(
                color: colors.onSurface.withOpacity(0.5),
                fontSize: 14,
              ),

              filled: true,
              fillColor: colors.surface, // 🔥 Theme-aware background

              /// BORDERS
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: _isFocused
                      ? colors.primary
                      : colors.outline.withOpacity(0.4),
                  width: _isFocused ? 2 : 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: colors.outline.withOpacity(0.3),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: colors.primary,
                  width: 2,
                ),
              ),

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),

              /// SUFFIX ICON (OPTIONAL)
              suffixIcon: widget.suffixWidget != null
                  ? GestureDetector(
                      onTap: widget.onSuffixTap,
                      child: widget.suffixWidget,
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}