import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'category_holder.dart';

Widget categoryItem(CategoryHolder categoryHolder, void Function() onClick) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, top: 4),
    child: Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(5),
          highlightColor: const Color(0xFFfbc100).withAlpha(60),
          splashColor: const Color(0xFFfbc100).withAlpha(60),
          onTap: onClick,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x34000000),
                  offset: Offset(
                    0.5,
                    0.5,
                  ),
                  blurRadius: 0.1,
                  spreadRadius: 0.3,
                ),
                BoxShadow(
                  color: Color(0x34000000),
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: Align(
              alignment: Alignment.center,
              child: SvgPicture.network(
                categoryHolder.image,
                width: 50,
                height: 50,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 80,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(categoryHolder.name,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300, fontSize: 8)),
          ),
        )
      ],
    ),
  );
}
