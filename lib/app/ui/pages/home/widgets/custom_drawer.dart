import 'package:disruptive_studio/app/ui/global_providers/session_provider.dart';
import 'package:disruptive_studio/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(flex: 1, child: Container()),
            MaterialButton(
              onPressed: () async {
                await SessionProvider().signOut();
              },
              minWidth: double.infinity,
              color: AppColors.white,
              child: const Text(
                'Sign out',
                style: TextStyle(
                  color: AppColors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
