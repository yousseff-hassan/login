import 'package:fad/core/sharedWedgits/basic_txt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({
    super.key,
    this.textColor = const Color(0xFF64748B),
    this.iconColor = const Color(0xFF64748B),
  });

  final Color textColor;
  final Color iconColor;

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      borderRadius: BorderRadius.circular(4.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _isChecked
                  ? Icons.check_box_rounded
                  : Icons.check_box_outline_blank_rounded,
              color: _isChecked ? const Color(0xFF2563EB) : widget.iconColor,
              size: 20.sp,
            ),
            SizedBox(width: 8.w),
            BasicText(
              text: 'Remember me',
              fontSize: 13.sp,
              isBold: false,
              color: widget.textColor,
            ),
          ],
        ),
      ),
    );
  }
}
