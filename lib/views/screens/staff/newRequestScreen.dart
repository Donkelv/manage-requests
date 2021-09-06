import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:request/shared/themeConst.dart';
import 'package:request/views/widgets/customdropdownWidg.dart';
import 'package:request/views/widgets/customtextField.dart';
import 'package:sizer/sizer.dart';

class NewRequestScreen extends StatefulWidget {
  static const routeName = "/newRequest";
  const NewRequestScreen({ Key key }) : super(key: key);

  @override
  _NewRequestScreenState createState() => _NewRequestScreenState();
}

class _NewRequestScreenState extends State<NewRequestScreen> {
  TextEditingController name;
  TextEditingController message;
  String category;
  String department;
  List<String> departmentList = ["Legal", "ESTAB", "Finance", "IT"];
  List<String> categoryList = ["Toner Request", "Monitor Request", "Mouse", "Keyboard", "Wireless Adapter", "Printer cables", "Network cables"];

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
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.arrow_back_ios, color: Colors.black,),

          ),
          title: Text("File Request", style: CustomTheme.mediumText(context).copyWith(fontWeight: FontWeight.w600,),),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 4.0.h,
              ),
              CustomTextField(
                controller: name, 
                hintText: "Name",
                function: (value){
                
              },),

              SizedBox(
                height: 3.0.h,
              ),
              CustomDropDownWidg(
                hintText: "Category",
                selectedValue: category,
                onChanged: (String value){
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
                onChanged: (String value){
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
                function: (value){
                
              },),
              SizedBox(
                height: 4.0.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}