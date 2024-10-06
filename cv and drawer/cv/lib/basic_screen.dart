import 'package:cv/pages/education_page.dart';
import 'package:flutter/material.dart';
import 'immutable_widget.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: ImmutableWidget(),
      ),
      drawer: Drawer(
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
                    Navigator.of(context).pop();
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
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const EducationPage()),
                    );
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
