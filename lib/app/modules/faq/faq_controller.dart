import 'package:get/get.dart';
import 'package:renner_coatings/app/data/model/faq/faq_model.dart';
import 'package:renner_coatings/app/data/repository/faq/faq_repository.dart';

class FaqController extends GetxController {
  FaqRepository _faqRepository = FaqRepository();
  final faqList = FaqModelList().obs;
  final loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getFaqList();
  }

  void getFaqList() async {
    loading.value = true;
    faqList.value = await _faqRepository.getListFaq();
    if (faqList.value.faqModelList != null) loading.value = false;
  }
}
