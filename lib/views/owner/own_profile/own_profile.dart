import 'package:medisan/styles/color_palette.dart';
// import 'package:medisan/views/owner/admin_view_feedback_page/admin_view_feedback_page_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../customer/cust_item_search/all_item_search_provider.dart';
// import '../../customer/cust_help/customer_help_page_provider.dart';
import '../../customer/cust_order_main/cust_order/cust_order_provider.dart';
import '../../initials/page_two.dart';

// OWNER PROFILE VIEW
class AdminProfilePageView extends StatefulWidget {
  const AdminProfilePageView({Key? key}) : super(key: key);

  @override
  _AdminProfilePageViewState createState() => _AdminProfilePageViewState();
}

class _AdminProfilePageViewState extends State<AdminProfilePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TOP BAR
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 40.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.arrow_back_ios),
              ),
              const Text('My Account')
            ],
          ),
        ),
      ),
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
                    ),
                  ),

                  // OWNER DETAILS - IMAGE, EMAIL
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
                            'adminowner@gmail.com',
                            style:
                                Theme.of(context).textTheme.headline3!.copyWith(
                                      color: CustomColors.PRIMARY,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),

            // PROFILE SECTIONS
            SizedBox(
              height: 600.0,
              child: ListView(
                children: ListTile.divideTiles(
                  context: context,
                  tiles: [
                    // MY ORDERS PAGE
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

                    // ALL PRODUCTS PAGE
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => AllItemSearchPageProvider(
                                  productType: "ALL",
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

                    // LOGOUT
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
                        color: CustomColors.ERROR,
                      ),
                      title: const Text(
                        'Log Out',
                        style: TextStyle(
                            color: CustomColors.ERROR,
                            fontWeight: FontWeight.bold),
                      ),
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
