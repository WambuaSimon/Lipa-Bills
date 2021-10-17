import 'package:flutter/material.dart';
import 'package:flutter_payment_app/component/colors.dart';
import 'package:flutter_payment_app/widgets/large_button.dart';
import 'package:flutter_payment_app/widgets/text_size.dart';
import 'dart:math' as math;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //get width and height of our screen
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            _listBills(),
            _payButton(),
          ],
        ),
      ),
    );
  }

  _buttonContainer() {
    return Positioned(
        bottom: 10,
        right: 50,
        child: GestureDetector(
          onTap: (){
            //show overlay and options menu
            showModalBottomSheet(
              isScrollControlled: true,
              barrierColor: Colors.transparent,
                backgroundColor:Colors.grey.withOpacity(0.5) ,
                context: context,
                builder: (BuildContext bc){
              return Container(
                height: MediaQuery.of(context).size.height *3/4,
              );
                });
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/lines.png')),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      offset: Offset(0, 1),
                      color: Color(0xFF11324d).withOpacity(0.2))
                ]),
          ),
        ));
  }

  _headSection() {
    return Container(
      height: 310,
      child: Stack(
        children: [
          _mainBackground(),
          _curveImageContainer(),
          _buttonContainer(),
        ],
      ),
    );
  }

  _mainBackground() {
    return Positioned(
      bottom: 10,
      left: 0,
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('images/background.png'))),
      ),
    );
  }

  _curveImageContainer() {
    return Positioned(
        left: 0,
        right: -2,
        bottom: 10,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/curve.png'),
            ),
          ),
        ));
  }

  _listBills() {
    return Positioned(
      top: 300,
      /*u have to set this properties when u use a list view inside a positioned widget*/
      left: 0,
      right: 0,
      bottom: 0,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(

          itemCount: 3,
          itemBuilder: (_, index){
            return Container(
              margin: EdgeInsets.only(top:10),
              height: 130,
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFd8dbe0),
                        offset: Offset(1, 1),
                        blurRadius: 20.0,
                        spreadRadius: 10)
                  ]),
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                  Border.all(width: 3, color: Colors.redAccent),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('images/brand1.png'))),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'KenGen Power',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.mainColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'ID:846594',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.idColor,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedText(
                            text: 'Auto pay on 23rd October 18',
                            color: AppColor.green),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColor.selectBackground),
                              child: Center(
                                child: Text(
                                  'Select',
                                  style: TextStyle(
                                      fontSize: 16, color: AppColor.selectColor),
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            Text(
                              "\$1245.00",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColor.selectColor,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "Due in 3 days",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.idColor,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10.0,
                            )
                          ],
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 5,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30))),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },

        ),
      )
    );
  }

  _payButton(){
    return Positioned(
      bottom: 10,
        child: LargeButton(text:'Pay all bills',textColor: Colors.white,));
  }
}
