import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';
import 'package:yadlo/features/posts/domain/entities%20/create_post_input.dart';

import '../../../../../auth/ui/pages/shared_preferances.dart';

class UploadCoverBottomSheet extends StatefulWidget {
  final void Function(AttachmentsModelInput selectedAttachment) onSelected;

  const UploadCoverBottomSheet({
    super.key,
    required this.onSelected,
  });

  static Future<void> showBottomSheet({
    context,
    required void Function(AttachmentsModelInput selectedAttachment) onSelected,
  }) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return UploadCoverBottomSheet(
          onSelected: onSelected,
        );
      },
    );
  }

  @override
  State<UploadCoverBottomSheet> createState() => _UploadCoverBottomSheetState();
}

class _UploadCoverBottomSheetState extends State<UploadCoverBottomSheet> {
  AttachmentsModelInput? _selectedAttachment;
  late ImagePicker piker = ImagePicker();

  void _openCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera, // alternatively, use ImageSource.gallery
      maxWidth: 400,
    );
    if (pickedFile == null) {
      return;
    } else {
      final attachmentType = pickedFile.path.endsWith(".mp3")
          ? AttachmentType.video
          : AttachmentType.photo;
      _selectedAttachment = AttachmentsModelInput(
        imageUrl: pickedFile.path,
        attachmentType: attachmentType,
      );
      widget.onSelected(AttachmentsModelInput(
          imageUrl: _selectedAttachment?.imageUrl ?? '',
          attachmentType: attachmentType));
      if (mounted) {
        Navigator.pop(context);
      }

      setState(() {});
    }
  }

  void _openGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery, // alternatively, use ImageSource.gallery
      maxWidth: 400,
    );
    if (pickedFile == null) {
      return;
    } else {
      final attachmentType = pickedFile.path.endsWith(".mp3")
          ? AttachmentType.video
          : AttachmentType.photo;
      _selectedAttachment = AttachmentsModelInput(
        imageUrl: pickedFile.path,
        attachmentType: attachmentType,
      );
      widget.onSelected(AttachmentsModelInput(
          imageUrl: _selectedAttachment?.imageUrl ?? '',
          attachmentType: attachmentType));
      if (mounted) {
        Navigator.pop(context);
      }
      await SharedPrefs.saveToShard(key: 'imageUrl', value: _selectedAttachment?.imageUrl??"");
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 16.sp,
        ),
        _upload(
          icon: Icons.camera,
          text: "Camera",
          onTap: _openCamera,
        ),
        _upload(
          icon: Icons.photo,
          text: "Gallery",
          onTap: () {
            _openGallery();
          },
        ),
        SizedBox(
          height: 16.sp,
        ),
      ],
    );
  }
}

Widget _upload({
  required IconData icon,
  required String text,
  required VoidCallback onTap,
}) {
  return ListTile(
    leading: Icon(icon),
    title: Text(
      text,
      style: Styles.normal(color: Colors.black, fontSize: 16.sp),
    ),
    onTap: onTap,
  );
}
