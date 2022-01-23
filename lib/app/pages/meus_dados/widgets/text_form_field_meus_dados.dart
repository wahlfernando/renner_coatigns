import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';

class TextFormFieldMeusDados extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  final bool isEmail;
  final bool isPhone;
  final bool isCpfCnpj;
  final TextEditingController controller;

  TextFormFieldMeusDados({Key? key, required this.textInputType, required this.hintText, this.isCpfCnpj = false, this.isPhone = false, this.isEmail = false, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaskTextInputFormatter maskTextInputFormatter = MaskTextInputFormatter(mask: isCpfCnpj ? "###.###.###-##" : "+## ## #########", filter: {"#": RegExp(r'[0-9]')});
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      child: TextFormField(
        controller: controller,
        readOnly: isEmail ? true : false,
        onChanged: isCpfCnpj
            ? (value) {
                if (value.length > 13) maskTextInputFormatter.updateMask(mask: "##.###.###/####-##", filter: {"#": RegExp(r'[0-9]')});
                if (value.length <= 13) maskTextInputFormatter.updateMask(mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
              }
            : null,
        keyboardType: textInputType,
        inputFormatters: isCpfCnpj | isPhone ? [maskTextInputFormatter] : null,
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
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

Widget textFormFieldPhoneMeuDados(TextInputType textInputType, String hintText) {
  TextEditingController textEditingController = new TextEditingController();

  final maskPhone = MaskTextInputFormatter(mask: "(##) # ####-####", filter: {"#": RegExp(r'[0-9]')});

  return Material(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    child: TextFormField(
      controller: textEditingController,
      keyboardType: textInputType,
      inputFormatters: [maskPhone],
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 18),
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
