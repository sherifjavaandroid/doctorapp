// ignore_for_file: unrelated_type_equality_checks

import 'package:google_fonts/google_fonts.dart';

import '../../backend/model/dashbaord/dashboard_model.dart';
import '../../utils/basic_screen_imports.dart';

class DepartmentDropDown extends StatelessWidget {
  final RxString selectMethod;
  final RxInt selectBranch;
  final List<BranchHasDepartment> itemsList;
  final String title;
  final void Function(BranchHasDepartment?)? onChanged;

  const DepartmentDropDown({
    required this.itemsList,
    Key? key,
    required this.selectMethod,
    this.onChanged,
    required this.selectBranch,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: crossStart,
          children: [
            Container(
              height: Dimensions.inputBoxHeight * 0.75,
              decoration: BoxDecoration(
                color: CustomColor.dropdownFillColor,
                border: Border.all(
                  color: CustomColor.primaryLightColor.withOpacity(0.3),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
              ),
              child: DropdownButtonHideUnderline(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 20),
                  child: DropdownButton(
                    hint: Padding(
                      padding:
                          EdgeInsets.only(left: Dimensions.paddingSize * 0.7),
                      child: CustomTitleHeadingWidget(
                     text:    Strings.selectDepartment,
                        style: GoogleFonts.inter(
                          color: CustomColor.primaryLightTextColor,
                          fontSize: Dimensions.headingTextSize3,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: Icon(
                        Icons.arrow_drop_down,
                        color:
                            CustomColor.primaryLightTextColor,
                      ),
                    ),
                    dropdownColor: Colors.white,
                    onTap: () {},
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Dimensions.headingTextSize3,
                      fontWeight: FontWeight.w500,
                    ),
                    isExpanded: true,
                    underline: Container(),
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                    items: itemsList
                        .where((element) =>
                            element.hospitalBranchId == selectBranch.value)
                        .map<DropdownMenuItem<BranchHasDepartment>>((value) {
                      return DropdownMenuItem<BranchHasDepartment>(
                        value: value,
                        child: Text(
                          value.hospitalDepartmentName,
                          style: CustomStyle.lightHeading3TextStyle.copyWith(
                            color: CustomColor.primaryLightTextColor,
                            fontSize: Dimensions.headingTextSize3,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: onChanged,
                  ),
                ),
              ),
            ),
            verticalSpace(Dimensions.heightSize * 1.6),
          ],
        ));
  }
}
