import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



PreferredSizeWidget appBarWidget({required String txt}){
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    title: Text(txt.toUpperCase(),  style: GoogleFonts.nunito(),),
  );
}