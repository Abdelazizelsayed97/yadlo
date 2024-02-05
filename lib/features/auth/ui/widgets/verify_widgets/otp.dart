import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:yadlo/features/auth/domain/entities/send_code_entites.dart';
import 'package:yadlo/features/auth/domain/entities/verify_entities.dart';

import '../../cubit/send_code_cubit/send_code_cubit.dart';

class OTPVerify extends StatefulWidget {
  const OTPVerify({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<OTPVerify> createState() => _OTPVerifyState();
}

class _OTPVerifyState extends State<OTPVerify> {
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

    /// Optionally you can use form to validate the Pinput
    return Form(
      key: formKey,
      child:

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Directionality(
                // Specify direction if desired
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
                    // return value == pinController ? null : '';
                    final value = _pinController.text;
                    return null;
                  },
                  onClipboardFound: (value) {
                    debugPrint('onClipboardFound: $value');
                    _pinController.setText(value);
                  },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    context.read<SendCodeCubit>().validateReceivedCode(
                          input: VerifyCodeInput(
                            email: widget.email,
                            verificationCode: _pinController.text,
                          ),
                        );


                  },
                  onChanged: (value) {

                  },
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
  }
}
