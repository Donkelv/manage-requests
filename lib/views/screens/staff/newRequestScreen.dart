import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:request/core/CRUD/makeRequest.dart';
import 'package:request/core/notifier/provider.dart';
import 'package:request/core/utils/validator.dart';
import 'package:request/shared/colorConst.dart';
import 'package:request/shared/themeConst.dart';
import 'package:request/views/widgets/customBtnWidg.dart';
import 'package:request/views/widgets/customdropdownWidg.dart';
import 'package:request/views/widgets/customtextField.dart';
import 'package:sizer/sizer.dart';

class NewRequestScreen extends StatefulWidget {
  static const routeName = "/newRequest";
  const NewRequestScreen({Key key}) : super(key: key);

  @override
  _NewRequestScreenState createState() => _NewRequestScreenState();
}

class _NewRequestScreenState extends State<NewRequestScreen> {
  TextEditingController name;
  TextEditingController message;
  String category;
  String department;
  List<String> departmentList = ["Legal", "ESTAB", "Finance", "IT"];
  List<String> categoryList = [
    "Toner Request",
    "Monitor Request",
    "Mouse",
    "Keyboard",
    "Wireless Adapter",
    "Printer cables",
    "Network cables"
  ];

  @override
  void initState() {
    super.initState();
    message = TextEditingController();
    name = TextEditingController();
  }

  @override
  void dispose() {
    message.dispose();
    name.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

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
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text(
            "File Request",
            style: CustomTheme.mediumText(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 4.0.h,
                  ),
                  CustomTextField(
                    controller: name,
                    hintText: "Title",
                    function: (value) {
                      return Validator().validateEmptyField(value, "Title");
                    },
                  ),
                  SizedBox(
                    height: 3.0.h,
                  ),
                  CustomDropDownWidg(
                    hintText: "Category",
                    selectedValue: category,
                    onChanged: (String value) {
                      setState(() {
                        category = value;
                      });
                    },
                    list: categoryList,
                  ),
                  SizedBox(
                    height: 3.0.h,
                  ),
                  CustomDropDownWidg(
                    hintText: "Department",
                    selectedValue: department,
                    onChanged: (String value) {
                      setState(() {
                        department = value;
                      });
                    },
                    list: departmentList,
                  ),
                  SizedBox(
                    height: 4.0.h,
                  ),
                  CustomTextField(
                    controller: message,
                    hintText: "Message",
                    minLine: 10,
                    maxLine: 10,
                    padding: true,
                    function: (value) {
                      return Validator().validateEmptyField(value, "Message");
                    },
                  ),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  Consumer(builder: (BuildContext context,
                      T Function<T>(ProviderBase<Object, T>) watch, Widget child){
                        return CustomBtnWidg(
                      color: primaryColor,
                      function: () {
                        
                        if(_formKey.currentState.validate()){
                          MakeRequest().makeRequest(name.text, category, department, message.text, context);
                        }
                      },
                      text: watch(authLoadProvider) != true ? "Sending..." : "Send"
                    );
                      })
                     
                
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
