import 'package:flutter/material.dart';

 bottomNavigationBarItem({required IconData icon, required String label}) {
  return BottomNavigationBarItem(
    title: Text(label, style: TextStyle(color: Colors.white, fontSize: 12),),
    icon: Icon(icon, color: Colors.white,),
  );
}