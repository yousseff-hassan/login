import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicTextField extends StatefulWidget {
  const BasicTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.isPassword,
    this.labelColor = const Color(0xFF5B5B5C),
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor = const Color(0xFFF8FAFC),
    this.width,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final Color labelColor;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final Color fillColor;
  final double? width;

  @override
  State<BasicTextField> createState() => _BasicTextFieldState();
}

class _BasicTextFieldState extends State<BasicTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: widget.labelColor,
          ),
        ),
        SizedBox(height: 6.h),
        SizedBox(
          width: widget.width ?? double.infinity,
          child: TextField(
            obscureText: _obscureText,
            controller: widget.controller,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Poppins',
              color: const Color(0xFF0F172A),
            ),
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: const Color(0xFF94A3B8),
                fontSize: 14.sp,
                fontFamily: 'Poppins',
              ),
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      color: const Color(0xFF2563EB),
                      size: 20.sp,
                    )
                  : null,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: const Color(0xFF94A3B8),
                        size: 20.sp,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : widget.suffixIcon,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 10.h,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Color(0xFFF1F5F9)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 1.5),
              ),
              filled: true,
              fillColor: widget.fillColor,
            ),
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
