

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget
{
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.person_2_fill,
            color: Colors.grey.shade900,
            size: 100,),
          const SizedBox(
            height: 10,
          ),
          Text(
            'User Management Tab',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text('You can add your new info or even change them on this tab',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: Colors.grey.shade900,
                fontSize: 18,
                fontWeight: FontWeight.w500
            )
            ,)
        ],
      ),
    );
  }
}