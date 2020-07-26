import 'package:dating_app/screens/recommendation_detail_screen.dart';
import 'package:dating_app/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    if (isPortrait)
      ScreenUtil.init(context,
          width: 414, height: 896, allowFontScaling: false);
    else
      ScreenUtil.init(context,
          width: 896, height: 414, allowFontScaling: false);

    return Scaffold(
        body: Column(
      children: <Widget>[
        _appBar(isPortrait),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return RecommendationDetailScreen();
            }));
          },
          child: _body(isPortrait),
        ),
        _footer(isPortrait),
      ],
    ));
  }

  Widget _footer(bool isPortrait) {
    return Container(
      // color: Colors.red,
      height: ScreenUtil().setHeight(isPortrait ? 137 : 80),
      child: BottomNav(
        width: ScreenUtil().setWidth(248),
        height: ScreenUtil().setHeight(64),
        size1: ScreenUtil().setWidth(64),
        size2: ScreenUtil().setWidth(56),
        size3: ScreenUtil().setWidth(64),
      ),
    );
  }

  Widget _body(bool isPortrait) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: <Widget>[
          // seteando tamanios
          Container(
            // color: Colors.green,
            width: ScreenUtil().setWidth(isPortrait ? 366 : 622),
            height: ScreenUtil().setHeight(isPortrait ? 622 : 250),
          ),
          // Positioned(
          //   bottom: -40,
          //   right: 0,
          //   child: Image(
          //       image: AssetImage(
          //         'assets/images/profile.png',
          //       ),
          //       fit: BoxFit.cover,
          //       height: 200 + 120.0,
          //       width: 200,
          //     ),
          // ),
          Positioned(
            top: ScreenUtil().setHeight(-10),
            child: Image.asset(
              'assets/images/profile.png',
              width: ScreenUtil().setWidth(isPortrait ? 366 : 622),
              height: ScreenUtil()
                  .setHeight(isPortrait ? 622 : 350), // ajuste manual
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 0,
            bottom: ScreenUtil().setHeight(40),
            child: Container(
              width: ScreenUtil().setWidth(isPortrait ? 342 : 420),
              height: ScreenUtil().setHeight(isPortrait ? 104 : 80),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Container(
                // color: Colors.red,
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(22),
                  top: ScreenUtil().setHeight(isPortrait ? 24 : 12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Malena Veronica, 23',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(24),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Fashion Designer at Victoria\'s Secret',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBar(bool isPortrait) {
    return Container(
      // color: Colors.red,
      height: ScreenUtil().setHeight(isPortrait ? 137 : 70),
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(24),
        right: ScreenUtil().setWidth(24),
        top: ScreenUtil().setHeight(isPortrait ? 56 : 20),
      ),
      child: Container(
        height: ScreenUtil().setHeight(34),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'For You*',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff4e486f),
              ),
            ),
            Image.asset(
              'assets/images/chatbubble.png',
              width: ScreenUtil().setWidth(24),
              height: ScreenUtil().setHeight(24),
            ),
          ],
        ),
      ),
    );
  }
}
