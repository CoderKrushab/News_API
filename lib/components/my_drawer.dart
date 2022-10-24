import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  bool active1 = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.only(left: 10, top: 30),
              width: double.infinity,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOd0P6OB5A3mUUPhTntTqk6FIy5jKdeccDxgUQZtGzfMPhEUW_GHpS1nmiVdBFOMjYhCo&usqp=CAU"),
                  ),
                  Spacer(),
                  Text(
                    "SK News",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 50,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: Column(
              children: [
                ExpansionPanelList(
                  expansionCallback: (panelIndex, isExpanded) {
                    active1 = !active1;
                    setState(() {});
                  },
                  children: <ExpansionPanel>[
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(
                              Icons.newspaper,
                              color: Colors.black,
                              size: 40,
                            ),
                            Text(
                              "Category of news",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        );
                      },
                      body: Column(
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.sports_cricket,
                              color: Colors.grey,
                            ),
                            title: const Text("Sports"),
                            onTap: () {
                              Navigator.of(context).pushNamed('sport');
                            },
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.business,
                              color: Colors.grey,
                            ),
                            title: const Text("Business"),
                            onTap: () {
                              Navigator.of(context).pushNamed('business');
                            },
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.movie,
                              color: Colors.grey,
                            ),
                            title: const Text("Entertainment"),
                            onTap: () {
                              Navigator.of(context).pushNamed('entertainment');
                            },
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.health_and_safety,
                              color: Colors.grey,
                            ),
                            title: const Text("Health"),
                            onTap: () {
                              Navigator.of(context).pushNamed('health');
                            },
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.science,
                              color: Colors.grey,
                            ),
                            title: const Text("Science"),
                            onTap: () {
                              Navigator.of(context).pushNamed('science');
                            },
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.accessibility_new_sharp,
                              color: Colors.grey,
                            ),
                            title: const Text("Technology"),
                            onTap: () {
                              Navigator.of(context).pushNamed('technology');
                            },
                          ),
                        ],
                      ),
                      isExpanded: active1,
                      canTapOnHeader: true,
                    ),
                  ],
                ),
                const ListTile(
                  leading: Icon(
                    Icons.call,
                    color: Colors.green,
                    size: 40,
                  ),
                  title: Text("Contact Us"),
                  onTap: callNumber,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.blue,
                    size: 40,
                  ),
                  title: Text("Settings"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

callNumber() async {
  const number = '9378456210';
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}
