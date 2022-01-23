import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/data/model/segment/business_unit_model.dart';
import 'package:renner_coatings/app/data/repository/api_response.dart';
import 'package:renner_coatings/app/data/repository/segment/segment.dart';

class SegmentosController extends GetxController {
  SegmentRepository segmentRepository;

  SegmentosController(this.segmentRepository);

  final businessUnit = BusinessUnit().obs;
  final isLoading = true.obs;
  final isError = false.obs;

  @override
  void onInit() {
    fetchSegments();
    super.onInit();
  }

  fetchSegments() async {
    ApiResponse<BusinessUnit> response = await segmentRepository.getSegments();
    if (response.ok == true) {
      businessUnit.value = response.result!;
      isError.value = false;
    } else {
      isError.value = true;
      onClickDialog(response.msg ?? "", 'Tentar novamente');
    }
    isLoading.value = false;
  }

  onClickDialog(String message, String action) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Container(
          height: Get.height / 3,
          child: Column(
            children: [
              Container(
                height: 20,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close),
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Erro",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
                child: Text(message, style: TextStyle(color: Colors.black)),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text(
                  action,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  fetchSegments();
                  Get.back();
                },
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(26, 10, 26, 10)), backgroundColor: MaterialStateProperty.all(Colors.red), elevation: MaterialStateProperty.all(0)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
