import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';
import 'package:renner_coatings/app/pages/produto_info/widgets/tile_item.dart';
import 'package:get/get.dart';

class ProdutoGeral extends StatelessWidget {
  final String description;
  final List<TileItem>? listDocumentos;
  final List<TileItem> listNormas;
  const ProdutoGeral({Key? key, required this.description, this.listDocumentos, required this.listNormas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset('assets/images/tintas.png', width: 200)),
          Text(
            description,
            style: font16Regular,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text("txt_documentos".tr, style: font14BoldRed),
          ),
          Column(
            children: listDocumentos ?? [],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text("normas".tr, style: font14BoldRed),
          ),
          Column(
            children: listNormas,
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
