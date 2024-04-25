import 'package:disruptive_studio/app/ui/pages/home/home_provider.dart';
import 'package:disruptive_studio/app/ui/pages/home/widgets/custom_drawer.dart';
import 'package:disruptive_studio/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final provider = context.watch<HomeProvider>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
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
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: AppColors.white,
              ),
              onPressed: () => scaffoldKey.currentState!.openDrawer(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              provider.listCoinsUi,
            ),
          ),
        ],
      ),
    );
  }
}
