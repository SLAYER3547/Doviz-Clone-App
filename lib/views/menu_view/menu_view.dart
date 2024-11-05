import 'package:doviz_clone_app/models/menu_models/other_menu_pages_model.dart';
import 'package:doviz_clone_app/models/menu_models/pages_model.dart';
import 'package:doviz_clone_app/models/menu_models/settings_pages_model.dart';
import 'package:doviz_clone_app/views/auth_views/login_view.dart';
import 'package:doviz_clone_app/views/auth_views/sign_up_view.dart';
import 'package:flutter/material.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  List<PageList> pageList = PageList.pageList;
  List<SettingsPagesList> settingsPagesList =
      SettingsPagesList.settingsPagesList;
  List<OtherMenuPagesList> otherMenuPagesList =
      OtherMenuPagesList.otherMenuPagesList;

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Menü',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginView(),),);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 10 * 3.7,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: const Color(0xFF172e3e),
                              borderRadius: BorderRadius.circular(50),),
                          child: const Text(
                            'Giriş Yapın',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpView(),),);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 10 * 3.7,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: const Color(0xFFffffff),
                              borderRadius: BorderRadius.circular(50),),
                          child: const Text(
                            'Kaydol',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpView(),),);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 10 * 9,
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xFF1a202c),
                          borderRadius: BorderRadius.circular(10),),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/app_logo_2.jpg',
                            width: 60,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Reklamsız kullan!',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                  margin: const EdgeInsets.only(top: 15, left: 10),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sayfalar',
                        style: TextStyle(color: Color(0xFF606a77)),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                        indent: 5,
                        endIndent: 5,
                      ),
                    ],
                  ),),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          _navigateToPage(context, pageList[index].targetPage);
                        },
                        leading: Icon(pageList[index].pageIcon),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              pageList[index].pageName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,),
                            ),
                            const Icon(Icons.arrow_forward_ios,
                                color: Colors.white,),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                        indent: 15,
                        endIndent: 15,
                      ),
                    ],
                  );
                },
                childCount: pageList.length,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                  margin: const EdgeInsets.only(top: 15, left: 10),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ayarlar',
                        style: TextStyle(color: Color(0xFF606a77)),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                        indent: 5,
                        endIndent: 5,
                      ),
                    ],
                  ),),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          _navigateToPage(
                              context, settingsPagesList[index].targetPage,);
                        },
                        leading: Icon(settingsPagesList[index].pageIcon),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              settingsPagesList[index].pageName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,),
                            ),
                            const Icon(Icons.arrow_forward_ios,
                                color: Colors.white,),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                        indent: 15,
                        endIndent: 15,
                      ),
                    ],
                  );
                },
                childCount: settingsPagesList.length,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                  margin: const EdgeInsets.only(top: 15, left: 10),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Diğer',
                        style: TextStyle(color: Color(0xFF606a77)),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                        indent: 5,
                        endIndent: 5,
                      ),
                    ],
                  ),),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          _navigateToPage(
                              context, otherMenuPagesList[index].targetPage,);
                        },
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              otherMenuPagesList[index].pageName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,),
                            ),
                            const Icon(Icons.arrow_forward_ios,
                                color: Colors.white,),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                        indent: 15,
                        endIndent: 15,
                      ),
                    ],
                  );
                },
                childCount: otherMenuPagesList.length,
              ),
            ),
          ],
        ),);
  }
}
