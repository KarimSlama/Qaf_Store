import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/images/circular_image.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircularImage(
        image: Assets.images.content.user.path,
        width: 50.w,
        height: 50.h,
        padding: 0,
      ),
      title: Text(
        'Karim Slama',
        style: Theme.of(context).textTheme.headlineSmall!.apply(
              color: QafColors.white,
            ),
      ),
      subtitle: Text(
        'karimslama@gmail.com',
        style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: QafColors.white,
            ),
      ),
      trailing: IconButton(
          onPressed: () {}, icon: Icon(Iconsax.edit4, color: QafColors.white)),
    );
  }
}
