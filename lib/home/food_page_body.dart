import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.90 );
  var _currPageValue=0.0;

  @override
  void initstate(){
      super.initState();
      pageController.addListener(() {
        setState(() {
          _currPageValue =  pageController.page!;
          print("Current value is"+_currPageValue.toString());
        });
      });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
        child: PageView.builder(
          controller: pageController,
            itemCount: 5,
            itemBuilder: (context,position) {
          return _buildPageItem(position);
        }),
    );
  }
  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "assets/image/food06.png"
                  )
              )
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: EdgeInsets.only(left:30, right: 30,bottom: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
          ),

            child: Container(
              padding: EdgeInsets.only(top: 10,left: 15,right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "veg burger"),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) => Icon(Icons.star,color:Color(0xFF69c5df),size: 15,)),
                      ),
                      SizedBox(width: 10,),
                      SmallText(text: "4.5"),
                      SizedBox(width: 10,),
                      SmallText(text: "1287"),
                      SizedBox(width: 10,),
                      SmallText(text: "Commets"),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      IconAndTextWidget(
                        icon: Icons.circle_sharp, text: " Normal",iconcolor: Color(0xFFffd28d)
                      ),
                      IconAndTextWidget(
                          icon: Icons.location_on, text: "1.7KM",iconcolor: Color(0xFF89dad0)
                      ),
                      IconAndTextWidget(
                          icon: Icons.access_time, text: "32min",iconcolor: Color(0xFFfcab88)
                      )
                    ],
                  )
                ],
              ),
            ),
        ),
       )
      ],
    );
  }
}
