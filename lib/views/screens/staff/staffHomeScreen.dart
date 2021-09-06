import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:request/core/models/requestModel.dart';
import 'package:request/shared/colorConst.dart';
import 'package:request/shared/imageConst.dart';
import 'package:request/shared/requestList.dart';
import 'package:request/shared/themeConst.dart';
import 'package:request/views/screens/staff/newRequestScreen.dart';
import 'package:request/views/screens/staff/viewRequestScreen.dart';
import 'package:request/views/widgets/customRequestWidget.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class StaffHomeScreen extends StatefulWidget {
  static const routeName = "/staffHomeScreen";
  const StaffHomeScreen({Key key}) : super(key: key);

  @override
  _StaffHomeScreenState createState() => _StaffHomeScreenState();
}

class _StaffHomeScreenState extends State<StaffHomeScreen> {
  List<RequestModel> limitedCount = [];
  @override
  void initState() {
    super.initState();
    limitedCount = requestList.take(5).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
        backgroundColor: Colors.white,
        body: Container(
          width: size.width,
          height: size.height,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4.0.h,
                    ),
                    Text(
                      "Welcome Elijah",
                      style: CustomTheme.largeText(context)
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 4.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.08),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Material(
                              type: MaterialType.transparency,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8.0),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, NewRequestScreen.routeName);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.0.h, vertical: 2.0.h),
                                      child: Container(
                                        width: size.width * 0.4,
                                        height: 10.0.h,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFF6F6F6),
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        child: Center(
                                            child: WebsafeSvg.asset(
                                                ImageConst.request,
                                                height: 6.0.h)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "New Request",
                                        style: CustomTheme.normalText(context)
                                            .copyWith(
                                          color: Color(0xFF666666),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.0.h,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0.w,
                        ),
                        Expanded(
                          child: Container(
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.08),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Material(
                              type: MaterialType.transparency,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8.0),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ViewRequestScreen.routeName);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.0.h, vertical: 2.0.h),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xFFF6F6F6),
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        width: size.width * 0.4,
                                        height: 10.0.h,
                                        child: Center(
                                            child: WebsafeSvg.asset(
                                                ImageConst.request,
                                                height: 6.0.h)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "View Request",
                                        style: CustomTheme.normalText(context)
                                            .copyWith(
                                          color: Color(0xFF666666),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.0.h,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Recent requests",
                          style: CustomTheme.mediumText(context).copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "View all",
                            style: CustomTheme.normalText(context).copyWith(
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: limitedCount.length,
                      itemBuilder: (context, index) {
                        return CustomRequestWidget(
                          request: limitedCount[index],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
