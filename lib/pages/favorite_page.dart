import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.wand_stars_inverse,
            color: Colors.grey.shade900,
            size: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Wishlist is Empty!",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "By scrolling item from left to right, you can add them to your wishlist",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.grey.shade900,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}