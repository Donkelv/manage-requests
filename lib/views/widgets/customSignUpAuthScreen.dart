import 'package:flutter/material.dart';
import 'package:request/core/auth/authApiRequest.dart';
import 'package:request/core/notifier/provider.dart';
import 'package:request/shared/colorConst.dart';
import 'package:request/shared/themeConst.dart';
import 'package:request/views/widgets/customtextField.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  TextEditingController firstname;
  TextEditingController lastname;
  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    passsword = TextEditingController();
    username = TextEditingController();
    firstname = TextEditingController();
    lastname = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    passsword.dispose();
    username.dispose();
    firstname.dispose();
    lastname.dispose();
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
              controller: firstname,
              function: (String value) {},
              hintText: "Firstname",
            ),
            SizedBox(
              height: 3.0.h,
            ),
            CustomTextField(
              controller: lastname,
              function: (String value) {},
              hintText: "Lastname",
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
              function: () {
                AuthApi().createAccount(username.text, lastname.text, firstname.text, email.text,  passsword.text, context);
              },
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  context
                      .read(authScreenProvider.notifier)
                      .authScreenState(false);
                },
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
