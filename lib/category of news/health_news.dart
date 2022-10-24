import 'package:flutter/material.dart';

import '../helper/news_helper.dart';
import '../modal/news_modals.dart';

class HealthNews extends StatefulWidget {
  const HealthNews({Key? key}) : super(key: key);

  @override
  State<HealthNews> createState() => _HealthNewsState();
}

class _HealthNewsState extends State<HealthNews> {
  late Future<News?> getHealthNewsData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHealthNewsData = NewsHelper.newsHelper.fetchAllHealthNewsData();
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
              "Health news",
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
                future: getHealthNewsData,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    News? data = snapshot.data;

                    return ListView.builder(
                      itemCount: data?.allHealthNews.length,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('detail',
                                arguments: data?.allHealthNews[i]['url']);
                          },
                          child: SizedBox(
                            width: double.infinity,
                            height: 460,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${data!.allHealthNews[i]['urlToImage']}"),
                                        fit: BoxFit.cover),
                                  ),
                                  height: 200,
                                  width: double.infinity,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "- ${data.allHealthNews[i]['source']['name']}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      "${data.allHealthNews[i]['publishedAt']}"
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
                                  "${data.allHealthNews[i]['title']}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  "${data.allHealthNews[i]['description']}",
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
