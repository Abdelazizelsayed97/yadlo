// import 'package:flutter/material.dart';
//
// import '../../../../cache/colors/colors.dart';
// import '../../../../core/Sizeable/commonSizes.dart';
// import '../../../../core/buttons/general_button.dart';
//
// class Terms extends StatefulWidget {
//   Terms({super.key});
//
//
//   @override
//   State<Terms> createState() => _TermsState();
// }
//
// class _TermsState extends State<Terms> {
//   bool value = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Future <bool?> showDialog<String>(
//       context: context, builder: (BuildContext context) =>
//         AlertDialog(
//           actionsAlignment: MainAxisAlignment.center,
//           elevation: 120,
//           alignment: Alignment.center,
//           // shape: RoundedRectangleBorder(
//           //     borderRadius: BorderRadius.all(Radius.circular(
//           //         20))),
//
//           content: Row(
//             children: [
//               Checkbox(
//                 value: value,
//                 onChanged: (newValue) {
//                   setState(() {
//                     value = newValue!;
//                   });
//                 },
//               ),
//               const Text.rich(
//                 TextSpan(
//                   children: [
//                     TextSpan(
//                       text: "I'm Agree to ",
//                       style: TextStyle(
//                         color: Color(0xFF374053),
//                         fontSize: 10,
//                         fontFamily: 'Somar Sans',
//                         fontWeight: FontWeight.w400,
//                         height: 0,
//                       ),
//                     ),
//                     TextSpan(
//                       text: 'Terms of Use',
//                       style: TextStyle(
//                         color: Color(0xFF374053),
//                         fontSize: 10,
//                         fontFamily: 'Somar Sans',
//                         fontWeight: FontWeight.w700,
//                         height: 0,
//                       ),
//                     ),
//                     TextSpan(
//                       text: ' and  ',
//                       style: TextStyle(
//                         color: Color(0xFF374053),
//                         fontSize: 10,
//                         fontFamily: 'Somar Sans',
//                         fontWeight: FontWeight.w400,
//                         height: 0,
//                       ),
//                     ),
//                     TextSpan(
//                       text: 'Privacy policy',
//                       style: TextStyle(
//                         color: Color(0xFF374053),
//                         fontSize: 10,
//                         fontFamily: 'Somar Sans',
//                         fontWeight: FontWeight.w700,
//                         height: 0,
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//           actions: <Widget>[
//             GeneralButton1(
//               width: SizeConfig.defaultSize! * 19,
//               colors: login1,
//               text: "Let's Go",
//               onTap: () {},
//
//             ),
//           ],
//         ),
//     );
//   }
// }
