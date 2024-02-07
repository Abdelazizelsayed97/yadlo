import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/core/di/dependency_injection.dart';
import 'package:yadlo/features/auth/domain/entities/reset_password.dart';
import 'package:yadlo/features/auth/domain/entities/verify_entities.dart';
import 'package:yadlo/features/auth/ui/pages/auth_accout.dart';
import 'package:yadlo/features/auth/ui/pages/login_pages/pass_recovery.dart';
import 'package:yadlo/features/posts/presentation/pages/time_line.dart';

import '../../../domain/entities/send_code_entites.dart';
import '../../cubit/send_code_cubit/send_code_cubit.dart';

class OTPVerify extends StatelessWidget {
  final String email;
  final PageUseCases useCase;


  const OTPVerify({required this.email, required this.useCase});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendCodeCubit(
        getIt(),
        getIt(),
        getIt(),
      ),
      child: OTPVerifyBody(
        email: email,
        useCase: useCase,
      ),
    );
  }
}

class OTPVerifyBody extends StatefulWidget {
  const OTPVerifyBody({Key? key, required this.email, required this.useCase})
      : super(key: key);
  final String email;
  final PageUseCases useCase;

  @override
  State<OTPVerifyBody> createState() => _OTPVerifyBodyState();
}

class _OTPVerifyBodyState extends State<OTPVerifyBody> {
  final _pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color(0xff939BDF);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(20, 10, 18, 0.4);

    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: borderColor),
      ),
    );

    return BlocListener<SendCodeCubit, SendCodeState>(
      listener: (context, state) {
        if (state is ResetInitial) {}
        if (state is ResetLoading) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(ColorsManger.primary),
                color: ColorsManger.primary,
              ),
            ),
          );
        }
        if (state is ResetSuccess) {
          print('RestListener');
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) =>  SetNewPass(code:_pinController.text ,email:widget.email ,)));
        }
        if (state is VerifySuccess) {
          print('RestListener');
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) =>  const TimeLinePage()));
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Directionality(
              textDirection: TextDirection.ltr,
              child: Pinput(
                keyboardType: TextInputType.number,
                controller: _pinController,
                focusNode: focusNode,
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: defaultPinTheme,
                separatorBuilder: (index) => const SizedBox(width: 8),
                validator: (value) {
                  final value = _pinController.text;
                  return null;
                },
                onClipboardFound: (value) {
                  debugPrint('onClipboardFound: $value');
                  _pinController.setText(value);
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  print('${widget.useCase}');
                  final useCase = widget.useCase;
                  if (useCase == PageUseCases.RegistrationPage) {
                    validateReceivedCode(pin);
                  } else if (useCase == PageUseCases.ResetPassword) {
                    validateResetPassword(pin);
                  }
                },
                onChanged: (value) {},
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: focusedBorderColor,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> validateReceivedCode(String pin) async {
    // String code = pinController.text;
    // final isValid = (context
    //     .read<SendCodeCubit>()
    //     .formKey
    //     .currentState
    //     ?.validate());
    // if (isValid != null) {
    //   context.read<SendCodeCubit>().validateReceivedCode(
    //       widget.email, pinController.text);
    //   if (code.length == 4 && isValid) {
    //     print('>>>>>>==');
    //     context.read<SendCodeCubit>().validateReceivedCode(
    //         widget.email, pinController.text);
    //     // BlocProvider.of<SendCodeCubit>(context)
    //     //     .validateReceivedCode(widget.email, code);
    //   } else {
    //     throw ApiServerError();
    //   }
    // }
    context.read<SendCodeCubit>().validateReceivedCode(
          input: VerifyCodeInput(
            email: widget.email,
            verificationCode: _pinController.text,
            // useCase: SendCodeUseCases.EMAIL_VERIFICATION,
            // useCase: widget.useCase,
          ),
        );
  }

  Future<void> validateResetPassword(String pin) async {
    context.read<SendCodeCubit>().validateResetPassword(
          input: ResetPasswordInput(
            useCase: SendCodeUseCases.PASSWORD_RESET,
            email: widget.email,
            verificationCode: _pinController.text,
          ),
        );
  }
}
