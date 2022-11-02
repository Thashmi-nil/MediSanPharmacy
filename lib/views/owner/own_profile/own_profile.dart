import 'package:medisan/styles/color_palette.dart';
// import 'package:medisan/views/owner/admin_view_feedback_page/admin_view_feedback_page_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../customer/cust_item_search/all_item_search_page_provider.dart';
// import '../../customer/cust_help/customer_help_page_provider.dart';
import '../../customer/cust_order/customer_order_page_provider.dart';
import '../../initials/page_two.dart';

class AdminProfilePageView extends StatefulWidget {
  const AdminProfilePageView({Key? key}) : super(key: key);

  @override
  _AdminProfilePageViewState createState() => _AdminProfilePageViewState();
}

class _AdminProfilePageViewState extends State<AdminProfilePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: 180,
                  ),
                  Positioned(
                    child: Container(
                      height: 180.0,
                      color: CustomColors.PRIMARY,
                    ),
                  ),
                  Positioned(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          const CircleAvatar(
                            radius: 40.0,
                            backgroundImage: NetworkImage(
                                "https://cdn.pixabay.com/photo/2017/07/18/18/01/little-girl-2516578_960_720.jpg"),
                            backgroundColor: Colors.transparent,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'admin@gmail.com',
                            style:
                                Theme.of(context).textTheme.headline3!.copyWith(
                                      color: CustomColors.BACKGROUND,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 600.0,
              child: ListView(
                children: ListTile.divideTiles(
                  context: context,
                  tiles: [
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => CustomerOrderPageProvider(
                                  role: 'admin',
                                  mode: 'normal',
                                ))));
                      },
                      leading: const Icon(
                        Icons.shopping_bag_outlined,
                        color: CustomColors.PRIMARY,
                      ),
                      title: const Text('My Orders'),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => AllItemSearchPageProvider(
                                  category: "ALL",
                                  mode: 'admin',
                                )),
                          ),
                        );
                      },
                      leading: const Icon(
                        Icons.propane_tank_outlined,
                        color: CustomColors.PRIMARY,
                      ),
                      title: const Text('Products'),
                    ),
                    // ListTile(
                    //   onTap: () {
                    //     Navigator.of(context).push(
                    //       MaterialPageRoute(
                    //         builder: ((context) =>
                    //             AdminViewFeedBackPageProvider()),
                    //       ),
                    //     );
                    //   },
                    //   leading: const Icon(
                    //     Icons.bookmark_added_outlined,
                    //     color: CustomColors.PRIMARY,
                    //   ),
                    //   title: const Text('Feedbacks'),
                    // ),
                    ListTile(
                      onTap: () {
                        FirebaseAuth.instance.signOut().then(
                              (value) => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) => const PageTwo()),
                                ),
                              ),
                            );
                      },
                      leading: const Icon(
                        Icons.logout_rounded,
                        color: CustomColors.PRIMARY,
                      ),
                      title: const Text('Log Out'),
                    ),
                  ],
                ).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
