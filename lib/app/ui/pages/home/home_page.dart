import 'package:disruptive_studio/app/ui/global_providers/session_provider.dart';
import 'package:disruptive_studio/app/ui/pages/home/widgets/custom_drawer.dart';
import 'package:disruptive_studio/app/utils/app_colors.dart';
import 'package:disruptive_studio/app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            backgroundColor: AppColors.primary,
            title: const Text(
              'Disruptive Studio',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            // flexibleSpace: FlexibleSpaceBar(
            //   background: Image.asset(
            //     'assets/hero.png',
            //     fit: BoxFit.cover,
            //   ),
            // ),
            floating: true,
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: AppColors.white,
              ),
              onPressed: () => scaffoldKey.currentState!.openDrawer(),
            ),
          )
        ],
      ),
    );
    // Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         const Text('home'),
    //         ElevatedButton(
    //           onPressed: () async {
    //             await SessionProvider().signOut();
    //           },
    //           child: const Text('Sign out'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
