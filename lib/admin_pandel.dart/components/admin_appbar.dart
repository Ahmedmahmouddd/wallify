import 'package:flutter/material.dart';
import 'package:wallify/admin_pandel.dart/admin_pandel.dart';

class AdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AdminAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (context) => const AdminPandel()), (route) => false);
            },
            icon: const Icon(
              Icons.exit_to_app_rounded,
              color: Colors.black,
              size: 32,
            ))
      ],
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      backgroundColor: Colors.grey[200],
      centerTitle: true,
      title: const Text("Add Wallpaper",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'p', fontSize: 28)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
