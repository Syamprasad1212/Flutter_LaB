import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,

          // APP BAR TITLE
          title: Row(
            children: [
              const Text(
                "Responsive UI",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),

              // LANDSCAPE MENU
              if (width >= 600) ...[
                const Spacer(),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Home",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),

        // PORTRAIT DRAWER
        drawer: width < 600
            ? Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "My Menu",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text("Home"),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text("Profile"),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text("Settings"),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text("Logout"),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              )
            : null,

        // BODY
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "android/asserts/images/wallpaper1.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: width < 400
                ? const Text(
                    "Mobile Screen",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.red,
                    ),
                  )
                : const Text(
                    "Large Screen",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
