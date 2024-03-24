import 'package:flutter/material.dart';

import '../theme/colors.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: appBlack.withOpacity(0.1),
            blurRadius: 1.0,
            spreadRadius: 1.0,
            offset: const Offset(0.0, -1.0),
          )
        ],
      ),
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStatePropertyAll(
            Theme.of(context).textTheme.bodySmall!.copyWith(color: appRed),
          ),
        ),
        child: NavigationBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          onDestinationSelected: (int index) {
           
            // explore
            if(index==0){
              print("ppsss");
            }
           // widhlist
            if(index==1){
              print("ooo");
            }
            //add
            if(index==2){
              print("ppp");
            }
            //chat
            if(index==3){
              print("qqq");
            }
            //profile
            if(index==4){
              print("rrr");
            }

          },
          indicatorColor: Colors.transparent,
          selectedIndex: 0,
          height: 56.0,
          destinations:  [
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              label: 'Explore',
              selectedIcon: Icon(
                Icons.search,
                color: appRed,
              ),
            ),
            InkWell(
              child: NavigationDestination(
                icon: Icon(Icons.favorite_border_outlined),
                label: 'Wishlist',
                selectedIcon: Icon(
                  Icons.favorite,
                  color: appRed,
                ),
              ),
              onTap:(){
                print("sss");

              },
            ),
            NavigationDestination(
              icon: Icon(Icons.add),
              label: 'Add',
              selectedIcon: Icon(
                Icons.add,
                color: appRed,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.message_outlined),
              label: 'Chat',
              selectedIcon: Icon(
                Icons.message,
                color: appRed,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
              selectedIcon: Icon(
                Icons.person,
                color: appRed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
