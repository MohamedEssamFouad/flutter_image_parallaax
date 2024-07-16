import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'data/dataImages.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Text(
                    'Vincent\nvan Gogh',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.sp,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '30 March 1853-29 July 1890',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Vincent Willem van Gogh was a Dutch post-impressionist painter who posthumously became one of the most famous and influential figures in the history of Western art.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        height: 300.h,
                        padding: EdgeInsets.only(bottom: 30),
                        child: PageView.builder(
                            itemCount: paintings.length,
                            controller: pageController,
                            itemBuilder: (context, i) {
                              return Transform.scale(
                                scale: 1,
                                child: Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          paintings[i]['image'],
                                          height: 370.h,
                                          fit: BoxFit.cover,
                                          alignment:
                                          Alignment(-pageOffset.abs() + i, 0),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,


                                        child: Text(
                                          paintings[i]['name'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 35.sp,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ],
              ),
            ),




      ),
    );
  }
}