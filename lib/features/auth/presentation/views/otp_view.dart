import 'package:bookia/core/widgets/custom_icon_back.dart';
import 'package:bookia/features/auth/presentation/widgets/otp_view_body.dart';
import 'package:flutter/material.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: CustomIconBack(), body: OtpViewBody());
  }
}
