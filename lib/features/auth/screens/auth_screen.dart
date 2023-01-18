import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/shared/widgets/custom_button.dart';
import 'package:amazon_clone/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
enum Auth{signup,login}

class AuthScreen extends StatefulWidget {
  static const String name = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
  
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: GlobalVariable.greyBackgroundCOlor,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome',style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24
            ),),
            ListTile(
               tileColor: _auth == Auth.signup ? GlobalVariable.backgroundColor : GlobalVariable.greyBackgroundCOlor,
              title: const Text('Create Account',style: TextStyle(
                fontWeight: FontWeight.bold,

              ),),
              leading: Radio(
                activeColor: GlobalVariable.secondaryColor,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth? value){
                  setState(() {
                    _auth = value!;
                  });
                },
              ),
            ),

            

            if(_auth == Auth.signup)
             _buildSignUpForm(),

            ListTile(
               tileColor: _auth == Auth.login ? GlobalVariable.backgroundColor : GlobalVariable.greyBackgroundCOlor,
              title: const Text('Sign-In',style: TextStyle(
                fontWeight: FontWeight.bold,

              ),),
              leading: Radio(
                activeColor: GlobalVariable.secondaryColor,
                value: Auth.login,
                groupValue: _auth,
                onChanged: (Auth? value){
                  setState(() {
                    _auth = value!;
                  });
                },
              ),
            ),

            if(_auth == Auth.login)
             _buildLoginForm(),
          ],
        ),
      )),
    );
  }
  // Build Signup
  _buildSignUpForm() => 
              Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariable.backgroundColor,
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    mainAxisAlignment : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextField(controller: _nameController,
                      hintText: "Name",),
                      SizedBox(height: 10,),
                      CustomTextField(controller: _emailController,
                      hintText: "Email",),
                      SizedBox(height: 10,),
                      CustomTextField(controller: _passwordController,
                      hintText: "Password",),
                      SizedBox(height: 10,),
                      CustomButton(text: "Sign up", onTap: (){

                      },
                      fontSize: 20,)
                    ],
                    
                  ),
                ),
              );



  _buildLoginForm() => 
              Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariable.backgroundColor,
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    mainAxisAlignment : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      SizedBox(height: 10,),
                      CustomTextField(controller: _emailController,
                      hintText: "Email",),
                      SizedBox(height: 10,),
                      CustomTextField(controller: _passwordController,
                      hintText: "Password",),
                      SizedBox(height: 10,),
                      CustomButton(text: "Sign-In", onTap: (){

                      },
                      fontSize: 20,)
                    ],
                    
                  ),
                ),
              );
}