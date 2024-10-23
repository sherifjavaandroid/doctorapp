
import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_widget_imports.dart';
import '../others/custom_image_widget.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          left: Dimensions.paddingSize * 0.58,
          right: Dimensions.paddingSize * 0.35,
          top: Dimensions.paddingSize * 0.2,
          bottom: Dimensions.paddingSize * 0.2,
        ),
        child: GestureDetector(
          onTap: onTap,
          child: CustomImageWidget(
            path: Assets.icon.backward,
            height: Dimensions.heightSize * 1.6.h,
          ),
        )

        // CircleAvatar(
        //   radius: 15,
        //   backgroundColor: CustomColor.primaryLightColor,
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 2),
        //     child: IconButton(
        //         onPressed: onTap,
        //         icon: Icon(
        //           Icons.arrow_back_ios,
        //           size: Dimensions.heightSize * 1.6,
        //         )),
        //   ),
        // ),
        );
  }
}
