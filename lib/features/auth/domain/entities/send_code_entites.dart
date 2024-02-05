import 'package:equatable/equatable.dart';


class SendCodeInput extends Equatable {
  // final List useCases = SendCodeUseCases.values.map((SendCodeUseCases useCase) => useCase.index).toList();
  final String email;
  final SendCodeUseCases? useCase;

   const SendCodeInput({

    required this.email,
    this.useCase,
  });

  @override
  List<Object?> get props => [
    email,
    useCase,
  ];
}

enum SendCodeUseCases {
  PASSWORD_RESET,
  PHONE_VERIFICATION,
  EMAIL_VERIFICATION
}

// extension SendUseCase on SendCodeUseCases {
//   String get useCase{
//     switch (this) {
//       case SendCodeUseCases.EMAIL_VERIFICATION:
//         return "EMAIL_VERIFICATION";
//       case SendCodeUseCases.PASSWORD_RESET:
//         return "PASSWORD_RESET";
//       case SendCodeUseCases.PHONE_VERIFICATION:
//         return "PHONE_VERIFICATION";
//     }
//   }
// }

