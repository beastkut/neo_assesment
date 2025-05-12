import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_assesment/features/authentication/data/firebase_auth_repo.dart';
import 'package:neo_assesment/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:neo_assesment/features/authentication/presentation/cubit/auth_states.dart';
import 'package:neo_assesment/features/booking/presentation/pages/booking_page.dart';
import 'package:neo_assesment/theme/lightmode.dart';

import 'features/authentication/presentation/pages/auth_page.dart';

class MyApp extends StatelessWidget {
  final firebaseAuthRepo = FirebaseAuthRepo();


  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit(authRepo: firebaseAuthRepo)..checkAuth())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        home: BlocConsumer<AuthCubit,AuthState>(
          builder: (context,authState){
            if(authState is Unauthenticated){
              return const AuthPage();
            }

            if(authState is Authenticated){
              return const BookingPage();
            }

            else{
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }, listener: (context,state){
            if(state is AuthError){
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message))
              );
            }
        },
        ),
      ),
    );
  }
}