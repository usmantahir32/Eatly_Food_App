import 'package:eatly_foodapp/views/bottom_navigation/bottom_navigation_tab.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/constants.dart';
import '../utils/size_config.dart';
import '../utils/style.dart';
import '../utils/widgets.dart';
import 'login.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isValid = false;
  bool obscurePassword=true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 10),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                     SizedBox(height: SizeConfig.heightMultiplier*17,),
                    Text('Create Your \nAccount',style: registerStyle,
                    ),
                    const SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextFormField(
                          style: TextStyle(
                              color: AppColors.textfeildiconcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.textMultiplier*2
                          ),
                          controller: usernameController,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return Message("Please Enter your name", context);
                            }
                            return null;
                          },
                          decoration:   InputDecoration(
                            prefixIcon: Icon(Icons.person_outline_rounded,color: AppColors.textfeildiconcolor,),
                            hintText: 'Full Name',
                            labelStyle: const TextStyle(color: Colors.black),
                            contentPadding: const EdgeInsets.all(25),
                            // disabledBorder:  OutlineInputBorder(
                            //   borderSide: BorderSide(color: Colors.teal,width: 2.5),
                            //   gapPadding: 8,
                            //   borderRadius: BorderRadius.all(Radius.circular(15),
                            //   ),
                            enabledBorder: InputBorder.none,
                            focusedBorder:
                            OutlineInputBorder(
                                borderRadius:  BorderRadius.circular(15.0),
                                borderSide:   BorderSide(color:AppColors.textfeildiconcolor,width: 2.5 )
                            ),
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child:TextFormField(
                          style: TextStyle(
                            color: AppColors.textfeildiconcolor,
                            fontSize: SizeConfig.textMultiplier*2,
                            fontWeight: FontWeight.w500,

                          ),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            _isValid = EmailValidator.validate(emailController.text);
                            if (emailController.text.isEmpty || _isValid == false) {
                              return Message("Please Enter Valid Email", context);
                            }
                          },
                          decoration:   InputDecoration(
                            prefixIcon:  Icon(Icons.mail_outline_outlined  ,color: AppColors.textfeildiconcolor,),
                            hintText: 'Enter Your Email',
                            labelStyle: const TextStyle(color: Colors.black),
                            contentPadding: const EdgeInsets.all(25),
                            enabledBorder: InputBorder.none,
                            focusedBorder:
                            OutlineInputBorder(
                                borderRadius:  BorderRadius.circular(15.0),
                                borderSide:   BorderSide(color: AppColors.textfeildiconcolor,width: 2.5 )
                            ),
                          ),

                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextFormField(
                          style: TextStyle(
                            color: AppColors.textfeildiconcolor,
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.textMultiplier*2,
                          ),
                          controller: passwordController,
                          obscureText: obscurePassword,
                          textInputAction: TextInputAction.done,

                          validator: (value) {
                            if (value!.length < 8) {
                              return Message("Password should be atlas 8 characters", context);
                            }
                          },
                          decoration:   InputDecoration(
                            suffixIcon: InkWell(
                                onTap: (){
                                  obscurePassword=!obscurePassword;
                                  setState((){

                                  });
                                },
                                child:obscurePassword==true?  Icon(Icons.visibility_off_outlined,color:Colors.grey[500],)
                                    :  Icon(Icons.visibility,color:AppColors.textfeildiconcolor,)),
                            prefixIcon:  Icon(Icons.lock_outline_rounded,color: AppColors.textfeildiconcolor,),
                            hintText: 'Password',
                            labelStyle: const TextStyle(color: Colors.black),
                            contentPadding: const EdgeInsets.all(25),
                            enabledBorder: InputBorder.none,
                            focusedBorder:
                            OutlineInputBorder(
                                borderRadius:  BorderRadius.circular(15.0),
                                borderSide:   BorderSide(color: AppColors.textfeildiconcolor,width: 2.5 )
                            ),
                          ),

                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: NeumorphicButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Get.to(BottomBar());
                              }
                            },
                            style:  NeumorphicStyle(
                                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
                                color: AppColors.textfeildiconcolor,
                                depth: 4,
                                intensity: 2,
                                surfaceIntensity: 2),
                            child:  Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    'Register',
                                    style:  TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: SizeConfig.textMultiplier*1.8),
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Text('Already Have An Account?',style: subtitleStyle,),
                          TextButton(onPressed: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Login()));
                          }, child:  Text("Sign In".tr,style: TextStyle(
                            fontSize: SizeConfig.textMultiplier*2,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),))
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(
                      thickness: 0.2,
                      color: AppColors.hintstyleColor  ,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text('Continue With Accounts',style: subtitleStyle,)),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffEBC9C7)
                              ),
                              onPressed: (){
                              },
                              child:const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Text("GOOGLE",style: TextStyle(color: Color(0xffD44638),fontSize: 16),
                                ),
                              )
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffC7D2E5)
                              ),
                              onPressed: (){
                              },
                              child:const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Text("FACEBOOK",style: TextStyle(color: Color(0xff4267B2),fontSize: 16),
                                ),
                              )
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                  right: 0,
                  child: Image.asset(
                    'assets/images/loginbg.png',
                    height: SizeConfig.imageSizeMultiplier*60,
                    // height:SizeConfig.heightMultiplier*15,
                    // fit: BoxFit.fill,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
