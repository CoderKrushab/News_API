import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../components/my_drawer.dart';
import '../helper/news_helper.dart';
import '../modal/news_modals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<News?> getNewsData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsData = NewsHelper.newsHelper.fetchAllNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "SK NEWS",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      drawerEnableOpenDragGesture: true,
      drawerDragStartBehavior: DragStartBehavior.down,
      drawer: const SideDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "Trending news",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 32,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: NewsHelper.newsHelper.fetchAllNewsData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  News? data = snapshot.data;

                  return ListView.builder(
                    itemCount: data?.allNews.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 10,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('detail',
                                    arguments: data?.allSportsNews[i]['url']);
                              },
                              child: SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15), // Image border
                                      child: Image.network("${data!.allNews[i]['urlToImage']}", fit: BoxFit.cover),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "- ${data.allNews[i]['source']['name']}",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blueAccent),
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          "${data.allNews[i]['publishedAt']}"
                                              .split("T")
                                              .first,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "- ${data.allNews[i]['title']}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      "- ${data.allNews[i]['description']}",
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
