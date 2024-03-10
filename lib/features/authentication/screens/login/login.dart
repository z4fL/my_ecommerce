import 'package:e_commerce/common/styles/spacing_styles.dart';
import 'package:e_commerce/common/widgets/login_signup/form_divider.dart';
import 'package:e_commerce/common/widgets/login_signup/social_buttons.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MySpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Header
              const MyLoginHeader(),

              // Form
              const MyLoginForm(),

              // Divider
              MyFormDivider(dividerText: MyTexts.orSignInWith.capitalize!),
              const SizedBox(height: MySizes.spaceBetweenSection),

              // Footer
              const MySocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
