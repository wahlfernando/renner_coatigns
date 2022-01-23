import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/color_gradient_screen.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';
import 'package:renner_coatings/app/data/model/tankLining/tankLining_normas_model.dart';
import 'package:renner_coatings/app/modules/tank_lining/tank_lining_controller.dart';

class TankAgentesNormasArgs {
  final String? nametittuloNormas;
  final String? nameTypecoating;

  TankAgentesNormasArgs({
    required this.nametittuloNormas,
    required this.nameTypecoating,
  });
}

class TankAgentesNormas extends StatelessWidget {
  // TankLiningNormasModel tankLiningNormasModel = TankLiningNormasModel();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as TankAgentesNormasArgs;
    return GetBuilder<TankLiningController>(builder: (controller) {
      return Scaffold(
        appBar:
            Appbar(titleText: "${args.nametittuloNormas}", isButtonBack: true),
        body: Stack(
          children: [
            ColorGradientScreen(),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Text(
                        "${args.nameTypecoating}",
                        style: font18BoldRed,
                      ),
                    ),
                    controller.tankLiningNormasModel == null
                        ? CircularProgressIndicator()
                        : Text(
                            "${controller.tankLiningNormasModel!.descriptionTypecoating}",
                            style: font16RegularGrey,
                            textAlign: TextAlign.justify,
                          ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Text(
                        "Notas",
                        style: font18RegularGrey,
                      ),
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.tankLiningNormasModel!.notes!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text(
                              "${controller.tankLiningNormasModel!.notes![index]}",
                              style: font16RegularGrey,
                              textAlign: TextAlign.justify,
                            ),
                          );
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
