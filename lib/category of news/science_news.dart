import 'package:flutter/material.dart';

import '../helper/news_helper.dart';
import '../modal/news_modals.dart';

class ScienceNews extends StatefulWidget {
  const ScienceNews({Key? key}) : super(key: key);

  @override
  State<ScienceNews> createState() => _ScienceNewsState();
}

class _ScienceNewsState extends State<ScienceNews> {
  late Future<News?> getScienceNewsData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getScienceNewsData = NewsHelper.newsHelper.fetchAllHealthNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 30,
          ),
        ),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "Science news",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 32,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: FutureBuilder(
                future: getScienceNewsData,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    News? data = snapshot.data;

                    return ListView.builder(
                      itemCount: data?.allScienceNews.length,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('detail',
                                arguments: data?.allScienceNews[i]['url']);
                          },
                          child: SizedBox(
                            width: double.infinity,
                            height: 440,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${data!.allScienceNews[i]['urlToImage']}"),
                                        fit: BoxFit.cover),
                                  ),
                                  height: 260,
                                  width: double.infinity,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "- ${data.allScienceNews[i]['source']['name']}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      "${data.allScienceNews[i]['publishedAt']}"
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
                                  "${data.allScienceNews[i]['title']}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  "${data.allScienceNews[i]['description']}",
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
