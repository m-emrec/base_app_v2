import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/localization/lang/locale_keys.g.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_paddings.dart';
import '../../../../core/utils/constants/spacing_sizes.dart';
import '../../../../product/utility/validator/validator_methods.dart';
import '../../../../product/widgets/buttons/buttons_import.dart';
import '../../../../product/widgets/custom_text_field.dart';
import '../../../../product/widgets/password_field.dart';
import 'sign_in_form_mixin.dart';

/// SignInForm widget
///
/// This widget is used to display the sign in form.
///
/// It has a form with two fields: email and password.
///
/// And a button to sign in.
class SignInForm extends ConsumerStatefulWidget {
  /// SignInForm widget
  ///
  /// This widget is used to display the sign in form.
  ///
  /// It has a form with two fields: email and password.
  ///
  /// And a button to sign in.
  const SignInForm({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> with SignInFormMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Card(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        color: AppColors.backgroundColor[60]?.withValues(alpha: 0.9),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Padding(
            padding: const AppPadding.horizontalxLSymmetric() +
                const AppPadding.verticalxLSymmetric(),
            child: SizedBox(
              width: inputFieldWidth,
              child: Column(
                spacing: SpacingSizes.large,
                children: [
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        ValidatorMethods(text: emailController.text).emptyField,
                    controller: emailController,
                    label: LocaleKeys.auth_signin_email.tr(),
                  ),
                  PasswordField(
                    signIn: signIn,
                    validator: (value) =>
                        ValidatorMethods(text: passwordController.text)
                            .emptyField,
                    passwordController: passwordController,
                  ),
                  Row(
                    children: [
                      ResponsiveElevatedButton(
                        onPressed: signIn,
                        child: Text(
                          LocaleKeys.auth_signin_pageTitle.tr(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
