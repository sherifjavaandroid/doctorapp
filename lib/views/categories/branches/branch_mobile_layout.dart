import '../../../../utils/basic_screen_imports.dart';
import '../../../backend/backend_utils/custom_loading_api.dart';
import '../../../controller/categories/branch_controller.dart';
import '../../../widgets/categories/brances_widget.dart';
import '../../../widgets/categories/search_widget.dart';

class BranchMobileScreenLayout extends StatelessWidget {
  const BranchMobileScreenLayout({super.key, required this.controller});
  final BranchController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        Strings.branches,
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
            hintText: Strings.searchHere.tr,
          ),
        ),
      ],
    );
  }

  _doctorDetails(BuildContext context) {
    var data = controller.foundBranches.value.isEmpty
        ? controller.branchesModel.data
        : controller.foundBranches.value;
    return data.isNotEmpty
        ? SizedBox(
            height: MediaQuery.sizeOf(context).height*1.5,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return BranchesWidget(
                    title: data[index].name,
                    details: data[index].description,
                    email: data[index].email,
                    web: data[index].web,
                  );
                }),
          )
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
