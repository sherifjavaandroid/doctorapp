import '../../../../utils/basic_screen_imports.dart';
import '../../../backend/backend_utils/custom_loading_api.dart';
import '../../../controller/categories/health_package_controller.dart';
import '../../../widgets/categories/health_widget.dart';
import '../../../widgets/categories/search_widget.dart';

class HeathPackageMobileScreenLayout extends StatelessWidget {
  const HeathPackageMobileScreenLayout({super.key, required this.controller});
  final HealthController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        Strings.healthPackage,
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
        horizontal: Dimensions.paddingSize * 0.5,
      ),
      children: [
        _searchBoxWidget(context),
        _doctorDetails(context),
        verticalSpace(Dimensions.heightSize * 10),
      ],
    );
  }

  // search box
  _searchBoxWidget(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: Dimensions.paddingSize * 0.3,
            bottom: Dimensions.paddingSize * 0.3,
          ),
          child: SearchWidget(
              onTap: () {
                controller.searchBarController.clear();

                controller.filterHealthPackage('');
              },
              onChanged: (value) {
                controller.filterHealthPackage(value);
              },
              controller: controller.searchBarController,
              hintText: Strings.searchHere.tr),
        ),
      ],
    );
  }

  _doctorDetails(BuildContext context) {
    var data = controller.foundHealthPackage.value.isEmpty
        ? controller.healthPackageModel.data.healthPackage
        : controller.foundHealthPackage.value;
    return data.isNotEmpty
        ? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: Dimensions.paddingSize),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return HeathWidget(
                title: data[index].name,
                price: double.parse(data[index].price).toStringAsFixed(2),
                details: data[index].title,
              );
            })
        : Column(
            mainAxisAlignment: mainCenter,
            crossAxisAlignment: crossCenter,
            children: [
              verticalSpace(Dimensions.heightSize * 5),
              const Center(
                child: TitleHeading3Widget(
                  text: Strings.noDataFound,
                ),
              ),
            ],
          );
  }
}
