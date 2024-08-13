import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:wholesalegrocery/screens/main/pages/brands.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Hey,Guest User",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black45, // Outline border color
                      width: 1.0,
                    ),
                    borderRadius:
                        BorderRadius.circular(60.0), // Rounded corners
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (e) {},
                    decoration: InputDecoration(
                      hintText: "FC-Lahore (QIE)",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 12),
                      suffixIcon: Icon(
                        Icons.location_pin,
                        size: 12,
                      ), // Prefix icon
                      border: InputBorder.none, // Remove default border
                      contentPadding:
                          const EdgeInsets.only(top: 12.0, left: 10),
                    ),
                  ),
                )),
            ListTile(
              leading: Icon(Icons.category, size: 20),
              title: Text(
                "Categories",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag, size: 20),
              title: Text(
                "My Cart",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_pin_circle_rounded, size: 20),
              title: Text(
                "My Profile",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard_customize, size: 20),
              title: Text(
                "My Orders",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
            ),
            ListTile(
              leading: Icon(Icons.cloud_done, size: 20),
              title: Text(
                "GrocerClub",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications, size: 20),
              title: Text(
                "Promo Alerts",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
            ),
            ListTile(
              leading: Icon(Icons.wine_bar, size: 20),
              title: Text(
                "GrocerChamp",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
            ),
            ListTile(
              onTap: () {
                shareInviteLink(context);
              },
              leading: Icon(Icons.share, size: 20),
              title: Text(
                "Share",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
            ),
            ListTile(
              leading: Icon(Icons.question_answer, size: 20),
              title: Text(
                "FAQs",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
            ),
            ListTile(
              leading: Icon(Icons.list, size: 20),
              title: Text(
                "Wish List",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (builder) => Brands()));
              },
              leading: Icon(Icons.info, size: 20),
              title: Text(
                "Brands",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
            ),
            ListTile(
              leading: Icon(Icons.help, size: 20),
              title: Text(
                "Help Center",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
            ),
            ListTile(
              leading: Icon(Icons.login, size: 20),
              title: Text(
                "Sign In",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "English",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void shareInviteLink(BuildContext context) {
    // Replace 'YOUR_INVITE_LINK' with your actual invite link
    final String inviteLink = 'https://yourapp.com/invite?ref=friend123';

    Share.share(
      'Join our app using my invite link: $inviteLink',
      subject: 'Join us on the app!',
    );
  }
}
