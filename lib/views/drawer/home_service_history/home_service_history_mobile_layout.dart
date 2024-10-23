import '../../../backend/backend_utils/custom_loading_api.dart';
import '../../../controller/drawer/home_service_history_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/others/history_home_widget.dart';

class HomeHistoryScreenMobileLayout extends StatelessWidget {
  const HomeHistoryScreenMobileLayout({super.key, required this.controller});
  final HomeHistoryController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        Strings.homeServiceHistory,
      ),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    var data = controller.homeHistoryModel.data;
    return data.isNotEmpty
        ? ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return HistoryWithExpansionWidget(
                status:
                    data[index].status == 1 ? Strings.booked : Strings.pending,
                statusColor: data[index].status == 1
                    ? CustomColor.greenColor
                    : CustomColor.yellowColor,
                onTap: () {},
                amount: data[index].patientMobile,
                title: data[index].patientName,
                dateText: data[index].date,
                transaction: data[index].schedule,
                monthText: data[index].month.substring(0, 3),

                //title
                statusTile:
                    data[index].status == 1 ? Strings.booked : Strings.pending,
                statusTileColor: data[index].status == 1
                    ? CustomColor.greenColor
                    : CustomColor.yellowColor,

                schedule: data[index].schedule,
                patientName: data[index].patientName,
                mobile: data[index].patientMobile,
                email: data[index].patientEmail,
              );
            })
        : Column(
            mainAxisAlignment: mainCenter,
            crossAxisAlignment: crossCenter,
            children: const [
              Center(child: TitleHeading3Widget(text: Strings.noDataFound))
            ],
          );
  }
}
