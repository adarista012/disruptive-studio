import 'package:disruptive_studio/app/routes/routes.dart';
import 'package:disruptive_studio/app/ui/pages/register/register.provider.dart';
import 'package:disruptive_studio/app/ui/widgets/custom_input.dart';
import 'package:disruptive_studio/app/utils/app_colors.dart';
import 'package:disruptive_studio/app/utils/app_constants.dart';
import 'package:disruptive_studio/app/utils/app_styles.dart';
import 'package:disruptive_studio/app/utils/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RegisterProvider>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppConstants.register.capitalizeFirst!,
                    style: AppStyles.title,
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Column(children: [
                    CustomInputFile(
                      label: AppConstants.authEmail,
                      inputType: TextInputType.emailAddress,
                      onChanged: provider.onEmailChanged,
                      validator: (text) {
                        if (isValidEmail(text!)) {
                          provider.emailValidatorChange(false);
                          return null;
                        } else {
                          return 'invalid email';
                        }
                      },
                    ),
                    CustomInputFile(
                      label: AppConstants.authPassword,
                      isPassword: true,
                      onChanged: provider.onPasswordChanged,
                      validator: (text) {
                        if (text!.trim().length >= 6) {
                          provider.passwordValidatorChange(false);
                          return null;
                        } else {
                          return 'invalid password';
                        }
                      },
                    ),
                    CustomInputFile(
                      label: AppConstants.authRepeatPassword,
                      isPassword: true,
                      onChanged: provider.onPasswordVerificationChanged,
                      validator: (text) {
                        if (text!.trim() == provider.password) {
                          provider.passwordVerificationValidatorChange(false);
                          return null;
                        } else {
                          return 'password do not match';
                        }
                      },
                    ),
                    const SizedBox(height: 16.0),
                    provider.isLoading
                        ? const CircularProgressIndicator(
                            color: AppColors.primary,
                          )
                        : MaterialButton(
                            onPressed: provider.emailValidator ||
                                    provider.passwordValidator ||
                                    provider.passwordVerificationValidator
                                ? null
                                : () => provider.submit(),
                            color: AppColors.primary,
                            minWidth: double.infinity,
                            disabledColor: AppColors.grey,
                            shape: const StadiumBorder(),
                            child: Text(
                              AppConstants.register.capitalizeFirst!,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('${AppConstants.alreadyHaveAnAccount}?'),
                        TextButton(
                          onPressed: () {
                            Get.offNamed(Routes.LOGIN);
                          },
                          child: const Text(AppConstants.login),
                        ),
                      ],
                    ),
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
