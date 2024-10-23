import '../../../backend/backend_utils/custom_loading_api.dart';
import '../../../controller/drawer/history_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/others/transaction_widget.dart';

class HistoryScreenMobileLayout extends StatelessWidget {
  const HistoryScreenMobileLayout({super.key, required this.controller});
  final HistoryController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        Strings.history,
      ),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    var data = controller.historyModel.data.booking;
    var mainDomain = controller.historyModel.data.prescriptionPaths.baseUrl;
    var pathLoaction =
        controller.historyModel.data.prescriptionPaths.pathLocation;
    var currency = controller.historyModel.data.booking;
    return data.isNotEmpty
        ? ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return TransactionWithExpansionWidget(
                status:
                    data[index].status == 1 ? Strings.booked : Strings.pending,
                statusColor: data[index].status == 1
                    ? CustomColor.greenColor
                    : CustomColor.yellowColor,
                onTap: () {},
                amount: data[index].fees,
                title: data[index].doctorName,
                dateText: data[index].date,
                transaction:
                    "${data[index].day},${data[index].fromTime}-${data[index].toTime}",
                monthText: data[index].month.substring(0, 3),

                //list tile
                statusTile:
                    data[index].status == 1 ? Strings.booked : Strings.pending,
                statusTileColor: data[index].status == 1
                    ? CustomColor.greenColor
                    : CustomColor.yellowColor,
                doctorName: data[index].doctorName,
                schedule: data[index].day,
                patientName: data[index].patientName,
                mobile: data[index].patientMobile!,
                email: data[index].patientEmail,
                type: data[index].type,
                fess: data[index].fees,
                payableAmount: data[index].details == null
                    ? ""
                    : "${double.parse(data[index].details!.payableAmount.toStringAsFixed(2)).toString()} ${currency[index].details!.currency}",
                paymentMethod: data[index].details == null
                    ? ""
                    : data[index].details!.paymentMethod,
                doctorFees: data[index].details == null
                    ? ""
                    : "${double.parse(data[index].details!.doctorFees.toStringAsFixed(2)).toString()} ${currency[index].details!.currency}",
                // download pdf button
                downloadButton: Obx(
                  () => controller.isDownloadLoading
                      ? const CustomLoadingAPI()
                      : InkWell(
                          onTap: () {
                            controller.downloadPDF(
                                url:
                                    "$mainDomain/$pathLoaction/${data[index].prescription}",
                                pdfFileName: data[index].patientEmail);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding:
                                EdgeInsets.all(Dimensions.paddingSize * 0.15),
                            decoration: ShapeDecoration(
                              color: CustomColor.greenColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius * 0.4),
                              ),
                            ),
                            child: TitleHeading3Widget(
                              text: Strings.download,
                              color: CustomColor.whiteColor,
                              fontSize: Dimensions.headingTextSize5,
                            ),
                          ),
                        ),
                ),

                downloadVisible: data[index].prescription == "" ? false : true,
              );
            },
          )
        : Column(
            mainAxisAlignment: mainCenter,
            crossAxisAlignment: crossCenter,
            children: const [
              Center(child: TitleHeading3Widget(text: Strings.noDataFound))
            ],
          );
  }
}
