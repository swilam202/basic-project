import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../extensions/context_extension.dart';
import '../../../network/failure.dart';

class FailureState extends StatelessWidget {
  const FailureState(this.failure,{super.key,this.retry,});

  final Failure failure;
  final VoidCallback? retry;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxH = constraints.maxHeight;
        final maxW = constraints.maxWidth;

        return ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: maxW,
              minHeight: maxH.isFinite && maxH > 0 ? maxH : 0,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child:        Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          failure.message?.isNotEmpty == true
                              ? failure.message!
                              : 'Something went wrong',
                          style: context.styles.mediumStyle(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      if (retry != null) ...[
                        SizedBox(width: 4.w),
                        IconButton(
                          onPressed: retry,
                          icon: Icon(
                            Icons.refresh_rounded,
                            color: context.colors.primary,
                            size: 26.r,
                          ),
                          tooltip: 'Retry',
                        ),
                      ],
                    ],
                  ),
            
            ),
          );
      },
    );
  }

}