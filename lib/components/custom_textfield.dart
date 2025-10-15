import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool obscure;
  final TextInputType? keyboardType;
  final bool readOnly;
  final IconData? prefixIcon;

  const CustomInputField({
    super.key,
    required this.label,
    required this.controller,
    this.obscure = false,
    this.keyboardType,
    this.readOnly = false,
    this.prefixIcon,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        readOnly: widget.readOnly,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          labelText: widget.label,
          border: const OutlineInputBorder(),
          prefixIcon:
              widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          suffixIcon: widget.obscure
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () => setState(() {
                    _obscureText = !_obscureText;
                  }),
                )
              : null,
        ),
      ),
    );
  }
}