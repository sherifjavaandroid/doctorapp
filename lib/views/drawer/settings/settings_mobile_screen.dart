import '../../../language/language_drop_down.dart';
import '../../../routes/routes.dart';
import '../../../utils/basic_screen_imports.dart';

class SettingMobileScreen extends StatelessWidget {
  SettingMobileScreen({
    super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        Strings.setting,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize * 0.8,
      ),
      children: [
        _changePasswordText(context),
        _changeLanguageWidget(context),
      ],
    );
  }

  _changePasswordText(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Container(
          margin: EdgeInsets.only(top: Dimensions.marginSizeVertical),
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.changePasswordScreen);
            },
            child: TitleHeading4Widget(
              text: Strings.changePassword,
              fontWeight: FontWeight.w500,
              fontSize: Dimensions.headingTextSize3,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        verticalSpace(Dimensions.heightSize),
        Divider(
          height: 1.5,
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
      ],
    );
  }

  _changeLanguageWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: TitleHeading4Widget(
                padding:
                    EdgeInsets.symmetric(vertical: Dimensions.paddingSize * .2),
                text: Strings.changeLanguage,
                fontWeight: FontWeight.normal,
                fontSize: Dimensions.headingTextSize3,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Expanded(
              flex: 2,
              child: ChangeLanguageWidget())
          ],
        ),
        Divider(
          thickness: Dimensions.radius * .1,
          color: CustomColor.whiteColor.withOpacity(.10),
        ),
      ],
    );
  }
}
