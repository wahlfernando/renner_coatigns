import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TileBusinessUnit extends Row {
  TileBusinessUnit({String? titleBusinessUnit})
      : super(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleBusinessUnit ?? "Texto",
              style: TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    'Normas',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.red,
                    size: 16,
                  ),
                ],
              ),
            )
          ],
        );
}
