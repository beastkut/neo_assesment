import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_assesment/features/authentication/presentation/component/my_button.dart';

import '../component/my_login.dart';
import '../component/my_text_field.dart';
import '../cubit/auth_cubit.dart';

class SignUpPage extends StatefulWidget {
  final void Function() togglePages;
  const SignUpPage({super.key,required this.togglePages});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  void register(){
    //prepare info
    final String name = nameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    final String confirmPassword = confirmPasswordController.text;

    //auth cubit
    final authCubit = context.read<AuthCubit>();

    //ensure the fields arent empty
    if(name.isNotEmpty && email.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty){

      // ensure passwords match
      if(password == confirmPassword){
        authCubit.register(name, email, password);
      }

      //password doesn't match
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Passwords do not match!")));
      }
    }

    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all the fields!")));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                  "Welcome to ABC Hotel \n Sign Up Now!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height: 50,),

                MyTextField(controller: nameController, hintText: "Name", obscureText: false, icon: Icons.person_2_outlined, isPassword: false  ,),

                SizedBox(height: 20,),

                MyTextField(controller: emailController, hintText: "Email", obscureText: false, icon: Icons.email_outlined, isPassword: false  ,),

                SizedBox(height: 20,),

                MyTextField(controller: passwordController, hintText: "Password", obscureText: true, icon: Icons.lock_outlined, isPassword: true,),

                SizedBox(height: 20,),

                MyTextField(controller: confirmPasswordController, hintText: "Confirm Password", obscureText: true, icon: Icons.lock_outlined, isPassword: true,),

                SizedBox(height: 20,),

                MyButton(text: "Sign Up", onTap: register),

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
                    Text("Already have an account ?",
                      style: TextStyle(
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.togglePages,
                      child: Text(
                        " Login Now.",
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
