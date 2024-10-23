import '../../../../utils/basic_screen_imports.dart';
import '../../../backend/backend_utils/custom_loading_api.dart';
import '../../../controller/categories/investigation/investigation_controller.dart';
import '../../../widgets/categories/investigation_widget.dart';
import '../../../widgets/categories/search_widget.dart';

class InvestigationMobileScreenLayout extends StatelessWidget {
  const InvestigationMobileScreenLayout({super.key, required this.controller});
  final InvestigationController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        Strings.investigation,
      ),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize * 0.7,
      ),
      children: [
        _searchBoxWidget(context),
        _doctorDetails(context),
        verticalSpace(Dimensions.heightSize * 5)
      ],
    );
  }

  // search box
  _searchBoxWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: mainCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: Dimensions.paddingSize * 0.3,
            bottom: Dimensions.paddingSize * 0.3,
          ),
          child: SearchWidget(
            onTap: () {
              controller.searchBarController.clear();
              controller.filterInvestigation('');
            },
            onChanged: (value) {
              controller.filterInvestigation(value);
            },
            controller: controller.searchBarController,
            hintText: Strings.searchHere.tr,
          ),
        ),
      ],
    );
  }

  _doctorDetails(BuildContext context) {
    var data = controller.foundInvestigation.value.isEmpty
        ? controller.investigationListModel.data.isvestigation
        : controller.foundInvestigation.value;
    return data.isNotEmpty
        ? ListView.builder(
            padding: EdgeInsets.only(bottom: Dimensions.paddingSize),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return InvestigationWidget(
                title: data[index].name,
                price: double.parse(data[index].offerPrice).toStringAsFixed(2),
                croxPrice: double.parse(data[index].price).toStringAsFixed(2),
              );
            })
        : Column(
            mainAxisAlignment: mainCenter,
            crossAxisAlignment: crossCenter,
            children: [
              verticalSpace(Dimensions.heightSize * 4),
              const Center(
                child: TitleHeading3Widget(
                  text: Strings.noDataFound,
                ),
              ),
            ],
          );
  }
}
