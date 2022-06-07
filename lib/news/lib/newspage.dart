// ignore_for_file: prefer_const_constructors

import 'package:first_ui/components/navigationbar.dart';
import 'package:first_ui/news/lib/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/customListTile.dart';
import 'model/article_model.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Latest Agriculture News",
          style: TextStyle(color: Colors.black),
        ),
      ),
      bottomNavigationBar: Navigationbar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            //let's check if we got a response or not
            if (snapshot.hasData) {
              //Now let's make a list of articles
              List<Article>? articles = snapshot.data;
              return ListView.builder(
                shrinkWrap: true,
                //Now let's create our custom List tile
                itemCount: articles!.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

List<Widget> _buildActions() => <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
        color: Colors.grey,
        tooltip: 'Search',
      ),
    ];
