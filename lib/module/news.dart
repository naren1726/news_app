import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/data/models.dart';
import 'package:flutter_task/data/repository.dart';
import 'package:flutter_task/module/news_card.dart';

enum Tab { All, Fav }

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Repository().getNewsList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsList(newsList: snapshot.data);
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class NewsList extends StatefulWidget {
  NewsList({this.newsList});
  final List<News> newsList;
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  Tab type = Tab.All;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.newsList.length,
          itemBuilder: (context, index) {
            if (type == Tab.All || widget.newsList[index].isFav)
              return NewsCard(
                news: widget.newsList[index],
                isHeart: widget.newsList[index].isFav,
                onHeartPressed: () {
                  setState(() {
                    if (widget.newsList[index].isFav) {
                      widget.newsList[index].unMarkFav();
                    } else {
                      widget.newsList[index].markFav();
                    }
                  });
                },
              );
            return Container();
          }),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
                onTap: () => setState(() => {type = Tab.All}),
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: (type == Tab.All) ? Color(0xff452DC1) : Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.list,
                        size: 35,
                        color: (type == Tab.All) ? Colors.white : Colors.black,
                      ),
                      Text(
                        'News',
                        style: TextStyle(
                            fontSize: 27,
                            color:
                                (type == Tab.All) ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => {type = Tab.Fav}),
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: (type == Tab.Fav) ? Color(0xff452DC1) : Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 35,
                      color: (type == Tab.Fav) ? Colors.white : Colors.red,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Favs',
                      style: TextStyle(
                          color:
                              (type == Tab.Fav) ? Colors.white : Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
