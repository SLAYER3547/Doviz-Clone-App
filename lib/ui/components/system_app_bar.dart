import 'package:doviz_clone_app/common/constants/icons/close_icon.dart';
import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:doviz_clone_app/ui/views/menu_view/menu_view.dart';
import 'package:flutter/material.dart';

class AuthViewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthViewsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: scaffoldAndAppBarBackgroundColor,
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MenuView()),);
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            child: const CloseIcon(),
          ),
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
