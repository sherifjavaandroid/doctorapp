import '../../utils/basic_screen_imports.dart';

import 'back_button.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar(
    this.title, {
    Key? key,
    this.backgroundColor,
    this.elevation = 0,
    this.autoLeading = false,
    this.showBackButton = true,
    this.action,
    this.leading,
    this.bottom,
    this.toolbarHeight,
    this.appbarSize,
    this.subTitle = '',
  }) : super(key: key);

  final String title;
  final String subTitle;
  final Color? backgroundColor;
  final double elevation;
  final List<Widget>? action;
  final Widget? leading;
  final bool autoLeading;
  final bool showBackButton;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final double? appbarSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: Column(
        mainAxisAlignment: mainCenter,
        crossAxisAlignment: crossCenter,
        mainAxisSize: mainMin,
        children: [
          TitleHeading2Widget(text: title),
          Visibility(
            visible: subTitle != '',
            child: TitleHeading4Widget(
              color: CustomColor.primaryLightTextColor.withOpacity(0.3),
              text: subTitle,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      actions: action,
      leading: showBackButton
          ? BackButtonWidget(
              onTap: () {
                Get.back();
              },
            )
          : null,
      bottom: bottom,
      elevation: elevation,
      toolbarHeight: toolbarHeight,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      automaticallyImplyLeading: autoLeading,
      iconTheme: const IconThemeData(
        color: Colors.grey,
        size: 30,
      ),
    );
  }

  @override
  // Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
  Size get preferredSize =>
      Size.fromHeight(appbarSize ?? Dimensions.appBarHeight);
}
