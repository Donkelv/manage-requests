import 'package:flutter/material.dart';
import 'package:request/shared/colorConst.dart';
import 'package:request/shared/themeConst.dart';
import 'package:request/views/widgets/customtextField.dart';
import 'package:sizer/sizer.dart';

import 'customBtnWidg.dart';

class CustomSignupAuthScreen extends StatefulWidget {
  const CustomSignupAuthScreen({Key key}) : super(key: key);

  @override
  _CustomSignupAuthScreenState createState() => _CustomSignupAuthScreenState();
}

class _CustomSignupAuthScreenState extends State<CustomSignupAuthScreen> {
  TextEditingController email;
  TextEditingController passsword;
  TextEditingController username;
  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    passsword = TextEditingController();
    username = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    passsword.dispose();
    username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Staff Request Portal",
              textAlign: TextAlign.start,
              style: CustomTheme.largeText(context)
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consectetur purus pulvinar dignissim ut imperdiet augue quam gravida amet. Mi cras sollicitudin leo dui.",
              softWrap: true,
              textAlign: TextAlign.start,
              style: CustomTheme.normalText(context)
                  .copyWith(fontWeight: FontWeight.w400, color: Colors.white),
            ),
            SizedBox(
              height: 5.0.h,
            ),
            CustomTextField(
              controller: email,
              function: (String value) {},
              hintText: "Email",
            ),
            SizedBox(
              height: 3.0.h,
            ),

            CustomTextField(
              controller: username,
              function: (String value) {},
              hintText: "Username",
            ),
            SizedBox(
              height: 3.0.h,
            ),
            CustomTextField(
              controller: passsword,
              function: (String value) {},
              hintText: "Password",
            ),
            SizedBox(
              height: 5.0.h,
            ),
            CustomBtnWidg(
              color: primaryColor,
              text: "Sign up",
              function: () {},
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Or Login",
                  style: CustomTheme.smallText(context).copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // CustomGoogleAuthBtn(
            //   function: (){
            //     Auth().signInWithGoogle(context);
            //   },
            // ),
            SizedBox(
              height: 5.0.h,
            ),
          ],
        ),
      ),
    );
  }
}
