import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';

class TextFieldFormPanel extends StatelessWidget {
  final String? hintText;
  final bool isBigText;
  final TextEditingController? editingController;
  final bool? isEnable;
  const TextFieldFormPanel({Key? key, required this.hintText, this.editingController, this.isEnable, this.isBigText = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      child: TextFormField(
        enabled: isEnable ?? true,
        controller: editingController,
        minLines: isBigText ? 5 : 1,
        maxLines: isBigText ? 5 : 1,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: font16RegularGrey,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: HexColor('DEDEDE')),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: HexColor('DEDEDE')),
          ),
        ),
      ),
    );
  }
}
