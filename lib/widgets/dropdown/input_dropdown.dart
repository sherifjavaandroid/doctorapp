import 'package:google_fonts/google_fonts.dart';

import '../../utils/basic_screen_imports.dart';

class InputDropDown extends StatelessWidget {
  final RxString selectMethod;
  final List<String> itemsList;

  final void Function(String?)? onChanged;

  const InputDropDown({
    required this.itemsList,
    Key? key,
    required this.selectMethod,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: Dimensions.inputBoxHeight * 0.8,
          decoration: BoxDecoration(
            border: Border.all(
              color: CustomColor.primaryLightTextColor.withOpacity(0.3),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
          ),
          child: DropdownButtonHideUnderline(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: DropdownButton(
                hint: Padding(
                  padding: EdgeInsets.only(left: Dimensions.paddingSize * 0.7),
                  child: Text(
                    selectMethod.value,
                    style: GoogleFonts.inter(
                        fontSize: Dimensions.headingTextSize3 + 2,
                        fontWeight: FontWeight.w400,
                        color: CustomColor.primaryLightColor),
                  ),
                ),
                icon: const Icon(Icons.arrow_drop_down,
                    color: CustomColor.primaryLightColor),
                isExpanded: true,
                underline: Container(),
                borderRadius: BorderRadius.circular(Dimensions.radius),
                items: itemsList.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(
                      value.toString(),
                      style: CustomStyle.lightHeading3TextStyle,
                    ),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ));
  }
}
