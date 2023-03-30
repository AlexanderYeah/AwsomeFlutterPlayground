import 'package:awsome_flutter/yongqi/movieCard/movie.dart';
import 'package:awsome_flutter/yongqi/movieCard/movie_sliding_card.dart';
import 'package:flutter/material.dart';

class MovieCardPage extends StatefulWidget {
  const MovieCardPage({super.key});
  @override
  State<MovieCardPage> createState() => _MovieCardPageState();
}

class _MovieCardPageState extends State<MovieCardPage> {
  List<Movie> _movies = [
    Movie(
        name: "I'm Fucking Legend",
        poster: "images/movie_1.png",
        date: "2021-09-09",
        intro: "天黑请闭眼",
        price: "29.99"),
    Movie(
        name: "水门桥",
        poster: "images/movie_2.png",
        date: "2021-09-09",
        intro:
            "该片以抗美援朝战争第二次战役中的长津湖战役后期的水门桥战役为背景 [84]  ，讲述志愿军第七连战士们在结束了新兴里和下碣隅里的战斗之后，又接到了更艰巨的阻击任务的故事",
        price: "29.99"),
    Movie(
        name: "除暴",
        poster: "images/movie_3.png",
        date: "2021-09-09",
        intro: "该片讲述了刑警钟诚受命追捕以张隼为首的犯罪团伙“老鹰帮”，他带领刑警小队咬死不放，最终破获惊天劫案的故事",
        price: "29.99"),
  ];

  PageController? _pageController;
  double _pageOffset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(viewportFraction: 0.84);

    _pageController!.addListener(() {
      setState(() {
        _pageOffset = _pageController!.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("轮播图"),
        ),
        body: SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            child: PageView(
              controller: _pageController,
              children: List.generate(_movies.length, (index) {
                return SlidingCard(
                    offset: _pageOffset - index, movie: _movies[index]);
              }),
            )));
  }
}
