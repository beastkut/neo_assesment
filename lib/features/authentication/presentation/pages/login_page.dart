import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_assesment/features/authentication/presentation/component/my_button.dart';
import 'package:neo_assesment/features/authentication/presentation/component/my_login.dart';
import 'package:neo_assesment/features/authentication/presentation/component/my_text_field.dart';
import 'package:neo_assesment/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:neo_assesment/features/authentication/presentation/pages/sign_up_page.dart';


class LoginPage extends StatefulWidget {
  final void Function() togglePages;
  const LoginPage({super.key, required this.togglePages});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login(){
    //prepare email & password
    final String email = emailController.text;
    final String password = passwordController.text;

    //auth cubit
    final authCubit = context.read<AuthCubit>();

    //check if email and password not empty
    if(email.isNotEmpty && password.isNotEmpty){
      //login
      authCubit.login(email, password);
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter both email and password!")));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: 200,),

                Text(
                  "Welcome to ABC Hotel \n Login Now!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height: 50,),

                MyTextField(controller: emailController, hintText: "Email", obscureText: false, icon: Icons.email_outlined, isPassword: false  ,),

                SizedBox(height: 20,),

                MyTextField(controller: passwordController, hintText: "Password", obscureText: true, icon: Icons.lock_outlined, isPassword: true,),

                SizedBox(height: 5,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot Password ?",style: TextStyle(color: Colors.blue.shade800,fontWeight: FontWeight.bold),)
                  ],
                ),


                SizedBox(height: 20,),

                MyButton(text: "Login", onTap: login),

                SizedBox(height: 20,),

                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey.shade400,
                        thickness: 1.5,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Or Login With',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),

                    Expanded(
                      child: Divider(
                        color: Colors.grey.shade400,
                        thickness: 1.5,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyLogin(text: "Google", IconPath: "lib/images/google.png"),
                    MyLogin(text: "Apple", IconPath: "lib/images/apple.png"),
                  ],
                ),

                Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have and account ?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.togglePages,
                      child: Text(
                        " Create an account.",
                        style: TextStyle(
                          color: Colors.blue.shade800,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
