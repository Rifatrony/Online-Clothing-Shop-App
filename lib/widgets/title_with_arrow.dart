import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWithArrow extends StatelessWidget {
  const TitleWithArrow({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: GoogleFonts.lobster(fontSize: 20, fontWeight: FontWeight.w300),),
          Row(
            children: [
              Text("See All", style: GoogleFonts.lobster(fontSize: 16,),),
              SizedBox(width: 6,),
              Icon(Icons.arrow_forward_ios, size: 18,)
            ],
          )
        ],
      ),
    );
  }

}

