import 'package:google_fonts/google_fonts.dart';

import '../../utils/basic_screen_imports.dart';
import '/backend/model/categories/find_doctor/get_payment_gateway_model.dart';

class PaymentDropDown extends StatelessWidget {
  final RxString selectMethod;
  final List<PaymentGateway> itemsList;

  final void Function(PaymentGateway?)? onChanged;

  const PaymentDropDown({
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
              color: CustomColor.primaryLightColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
          ),
          child: DropdownButtonHideUnderline(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: DropdownButton(
                menuMaxHeight: MediaQuery.sizeOf(context).height*0.5,
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
                items: itemsList.map<DropdownMenuItem<PaymentGateway>>((value) {
                  return DropdownMenuItem<PaymentGateway>(
                    value: value,
                    child: Text(
                      value.name,
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
