import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rukn_app/utils/static_data.dart';
import 'package:rukn_app/utils/theme_manager.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Language Icon
          const CircleAvatar(
            backgroundImage: AssetImage(languageImageUrl),
            radius: 20,
            backgroundColor: Colors.white,
          ),
          // User Mode (Guest or Username)
          Text(
            'Rukn',
         style: GoogleFonts.nunito().copyWith(fontSize: 18,color: ThemeManager.primaryColor),

            // style: theme.textTheme.bodyText1,
          ),
          // Profile Image
          const CircleAvatar(
            backgroundImage: AssetImage(profileImageUrl),
            radius: 20,
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
