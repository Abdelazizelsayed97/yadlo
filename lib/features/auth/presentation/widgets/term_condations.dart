import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text:
                'By clicking Agree and Register, you agree to ',
                style: TextStyle(
                  color: Color(0xFF374053),
                  fontSize: 10,
                  fontFamily: 'Somar Sans',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              TextSpan(
                text: 'Terms of use',
                style: TextStyle(
                  color: Color(0xFF374053),
                  fontSize: 10,
                  fontFamily: 'Somar Sans',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              TextSpan(
                text: ' and ',
                style: TextStyle(
                  color: Color(0xFF374053),
                  fontSize: 10,
                  fontFamily: 'Somar Sans',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
