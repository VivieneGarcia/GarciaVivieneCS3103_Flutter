import 'package:cv/basic_screen.dart';
import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 46, 46),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text("My CV",
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: const Center(
        child: Text('Education Page',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      drawer: Drawer(
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.zero,
        // ),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Container(
            color: const Color.fromARGB(255, 249, 249, 249),
            child: ListView(
              children: [
                const DrawerHeader(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'CV Sections',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text(
                    "Profile",
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BasicScreen()));
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.grade),
                  title: const Text(
                    "Education",
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.ads_click_sharp),
                  title: Text(
                    "Skills",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.brush),
                  title: Text(
                    "Projects",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.accessibility_rounded),
                  title: Text(
                    "Experience",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const Divider(),
              ],
            )),
      ),
    );
  }
}
