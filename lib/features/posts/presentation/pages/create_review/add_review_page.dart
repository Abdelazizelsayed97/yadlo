// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:yadlo/core/helper/spacing.dart';
// import 'package:yadlo/features/posts/domain/entities%20/create_post_input.dart';
//
// import '../../../../../cache/text_styles/text_styles.dart';
//
// class AddReviewPage extends StatefulWidget {
//   const AddReviewPage({super.key});
//
//   @override
//   State<AddReviewPage> createState() => _AddReviewPageState();
// }
//
// class _AddReviewPageState extends State<AddReviewPage> {
//   SelectedTypeEnum? _selectedType;
//   late final Color _containerColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: ListView.separated(
//             itemBuilder: (context, index) {
//               final type = SelectedTypeEnum.values[index];
//               return ListTile(
//                 title: Container(
//                   height: 270.h,
//                   width: 300.w,
//                   decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.all(Radius.circular(19)),
//                       color: _selectedType == type
//                           ? const Color(0xff0B1A51)
//                           : Colors.transparent,
//                       border: Border.all(color: Colors.grey)),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset(
//                         type.icon,
//                         height: 100.h,
//                       ),
//                       verticalSpace(15),
//                       Text(
//                         type.localizationName,
//                         style: Styles.semiBlod(
//                             color: _selectedType == type
//                                 ? Colors.white
//                                 : Colors.black,
//                             fontSize: 13),
//                       ),
//                       verticalSpace(15),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20.w),
//                         child: Text(
//                           textAlign: TextAlign.center,
//                           type.subTitle,
//                           style: Styles.meduim(
//                               color: _selectedType == type
//                                   ? Colors.white
//                                   : Colors.black,
//                               fontSize: 13),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 onTap: () {
//                   _selectedType = type;
//                   setState(() {});
//                   print('type is  >>>>>>> ${type.localizationName}');
//                 },
//               );
//             },
//             separatorBuilder: (context, index) => const SizedBox(
//               height: 30,
//             ),
//             itemCount: SelectedTypeEnum.values.length,
//           ),
//         ),
//       ],
//     );
//   }
// }
