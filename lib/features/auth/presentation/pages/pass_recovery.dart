import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/themData/them_data.dart';
import 'package:yadlo/core/Sizeable/commonSizes.dart';
import 'package:yadlo/core/buttons/general_button.dart';
import 'package:yadlo/core/textForm/custom_textform.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';

class SetNewPass extends StatelessWidget {
  const SetNewPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(alignment: Alignment.topCenter,
        child: Stack(
            children: [Opacity(opacity: .1,child: ThemeDataApp(),),
          Column(
              children: [
            SizedBox(
              height: SizeConfig.defaultSize! * 15,
            ),
            SvgPicture.asset(
              'assets/images/passlogo.svg',
              height: 100,
            ),
            SizedBox(
              height: SizeConfig.defaultSize! * 5,
            ),
            const CustomStyle22(text: "Set new password"),
            SizedBox(
              height: SizeConfig.defaultSize! * 4,
            ),
            Container(padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(19)),
              height: SizeConfig.defaultSize! * 36,width: SizeConfig.defaultSize!*35,

              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextForm2(text: 'Enter New Password', hintText: '',),

                  TextForm2(text: 'Enter New Password', hintText: '',),
                  GeneralButton1(colors: ig3,text: 'Send',)
                ],
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
