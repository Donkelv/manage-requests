import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:request/core/notifier/provider.dart';
import 'package:request/shared/adminReqPageView.dart';
import 'package:request/shared/colorConst.dart';
import 'package:request/shared/themeConst.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminHomeScreen extends StatefulWidget {
  static const routeName = "/adminHome";
  const AdminHomeScreen({ Key key }) : super(key: key);

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.dark,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        // appBar: AppBar(
        //   elevation: 0.0,
        //   backgroundColor: Colors.green,
        //   centerTitle: true,
        //   // leading: IconButton(
        //   //   onPressed: () {
        //   //     Navigator.pop(context);
        //   //   },
        //   //   icon: Icon(
        //   //     Icons.arrow_back_ios,
        //   //     color: Colors.black,
        //   //   ),
        //   // ),
        //   title: Text(
        //     "All Requests",
        //     style: CustomTheme.mediumText(context).copyWith(
        //       fontWeight: FontWeight.w600,
        //     ),
        //   ),
        // ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.0.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                        height: 4.0.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome Admin",
                            style: CustomTheme.largeText(context)
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          IconButton(
                            icon: Icon(Icons.logout), 
                            onPressed: () async{
                              await FirebaseAuth.instance.signOut().then((value) => context.read(authLoadProvider.notifier).notify(false),);
                            },),
                        ],
                      ),
                SizedBox(
                  height: 4.0.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: currentIndex != 0 ? Colors.white : primaryColor,
                          borderRadius: BorderRadius.circular(100.0),
                          boxShadow: currentIndex != 0 ? [] : [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.08),
                              blurRadius: 5.0,
                              offset: Offset(0, 1),
                            )
                          ],),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100.0),
                          onTap: () {
                            _pageController.jumpToPage(0);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                "Pending",
                                style: CustomTheme.normalText(context).copyWith(
                                  color: currentIndex != 0
                                      ? Color(0xFF666666)
                                      : Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: currentIndex != 1 ? Colors.white : primaryColor,
                          borderRadius: BorderRadius.circular(100.0),
                          boxShadow: currentIndex != 1 ? [] : [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.08),
                              blurRadius: 5.0,
                              offset: Offset(0, 1),
                            )
                          ]),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100.0),
                          onTap: () {
                            _pageController.jumpToPage(1);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                "Rejected",
                                style: CustomTheme.normalText(context).copyWith(
                                  color: currentIndex != 1
                                      ? Color(0xFF666666)
                                      : Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: currentIndex != 2 ? Colors.white : primaryColor,
                          borderRadius: BorderRadius.circular(100.0),
                          boxShadow: currentIndex != 2 ? [] : [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.08),
                              blurRadius: 5.0,
                              offset: Offset(0, 1),
                            )
                          ]),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100.0),
                          onTap: () {
                            _pageController.jumpToPage(2);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                "Approved",
                                style: CustomTheme.normalText(context).copyWith(
                                  color: currentIndex != 2
                                      ? Color(0xFF666666)
                                      : Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (int value){
                      setState(() {
                        currentIndex = value;                  
                      });
                    },
                    itemCount: adminReqPageViewList.length,
                    itemBuilder: (context, index){
                      return adminReqPageViewList[index];
                    }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}