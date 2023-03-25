import 'dart:math' as math;
import 'dart:ui';
import 'package:awsome_flutter/yongqi/movieCard/movie.dart';
import 'package:flutter/material.dart';

class SlidingCard extends StatelessWidget {
  //动画偏移量
  final double offset;
  // 电影模型
  final Movie movie;
  SlidingCard({Key? key, required this.offset, required this.movie});

  @override
  Widget build(BuildContext context) {
    // 计算拖拽过程中的偏移量
    double gauss = math.exp(-(math.pow(offset.abs() - 0.5, 2))) / 0.08;

    return Transform.translate(
      offset: Offset(-32 * gauss.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.asset(
                "${movie.poster}",
                height: MediaQuery.of(context).size.height * 0.3,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${movie.name}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text("上映日期:${movie.date}",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey)),
                  Text(
                    "${movie.intro}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          "立即购买",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "${movie.price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
