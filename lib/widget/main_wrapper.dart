

import 'package:bottom_nav_bar/bloc/bottom_nav_cubit.dart';
import 'package:bottom_nav_bar/pages/home_page.dart';
import 'package:bottom_nav_bar/pages/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

//Top level Pages
  final List <Widget> topLevelPages = [
    HomePage(),
    FavoritePage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  // on page changed when user tries to change the page by scrolling on the screen

  void onPageChanged(int page) {
    BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      appBar: _mainWrapperAppBar(),
      bottomNavigationBar: _mainWrapperBottomNavBar(context),
      floatingActionButton: _mainWrapperFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: _mainWrapperBody(),
    );
  }


//app bar main wrapper widget

  AppBar _mainWrapperAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Bottom Navigation Bar with Cubit', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
    );
  }


// BODY MAIN WRAPPER WIDGET

  PageView _mainWrapperBody() {
    return PageView(
      onPageChanged: (int page)=> onPageChanged(page),
      controller: pageController,
      children: topLevelPages,
    );
  }


// Bottom Navigation Bar Single item - MainWrapper Widget
  Widget _bottomAppBarItem(BuildContext context, {
    required defaultIcon,
    required page,
    required label,
    required filledIcon,
  }) {
    return GestureDetector(
      onTap: () {
        //bloc provider handles the state management
        //<BottomNavCubit> is a instance
        // changeSelectedIndex will take input from the above Constructor if user selects home icon it send input as 0 and 1 for favourite and so on
        BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);

        pageController.animateToPage(page,
            duration: const Duration(milliseconds: 20),
            curve: Curves.fastLinearToSlowEaseIn
        );
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),

            //context.watch will check which currently page is opened and will modifiy the state according to that through will color at the bottom nav bar will customized
            Icon(context
                .watch<BottomNavCubit>()
                .state == page ? filledIcon : defaultIcon,
              color: context
                  .watch<BottomNavCubit>()
                  .state == page ? Color.fromARGB(255, 131, 227, 16) :
              Colors.grey.shade700,
              size: 26,),

            const SizedBox(height: 3,),

            Text(label, style: GoogleFonts.aBeeZee(
                color: context
                    .watch<BottomNavCubit>()
                    .state == page ? Color.fromARGB(255, 131, 227, 16) :
                Colors.grey.shade700, fontSize: 10,
                fontWeight: context
                    .watch<BottomNavCubit>()
                    .state == page ? FontWeight.w600 : FontWeight.w400),)
          ],
        ),
      ),
    );
  }

//Bottom Naviagtion Bar

  BottomAppBar _mainWrapperBottomNavBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _bottomAppBarItem(context, defaultIcon: IconlyLight.home,
                  page: 0,
                  label: 'Home',
                  filledIcon: IconlyBold.home),
              _bottomAppBarItem(context, defaultIcon: IconlyLight.heart,
                  page: 1,
                  label: 'Favorite',
                  filledIcon: IconlyBold.heart),
              _bottomAppBarItem(context, defaultIcon: IconlyLight.notification,
                  page: 2,
                  label: 'Notifs',
                  filledIcon: IconlyBold.notification),
              _bottomAppBarItem(context, defaultIcon: IconlyLight.profile,
                  page: 3,
                  label: 'Profile',
                  filledIcon: IconlyBold.profile),
            ],
          )
          ),
          const SizedBox(
            width: 40,
            height: 20,
          ),
        ],
      ),
    );
  }

// Floating Action Button - MainWrapper Widget
  FloatingActionButton _mainWrapperFab() {
    return FloatingActionButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Color.fromARGB(255, 7, 7, 7),
            content: Text("New post will generate in upcoming 2 mins 📮"),
          ),
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      backgroundColor: Color.fromARGB(255, 154, 227, 66),
      child: const Icon(Icons.add, color: Colors.white,),
    );
  }
}


