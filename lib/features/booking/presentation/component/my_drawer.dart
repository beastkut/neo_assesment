import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_assesment/features/authentication/domain/entity/app_user.dart';
import 'package:neo_assesment/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:neo_assesment/features/booking/presentation/component/my_drawer_tile.dart';


class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  late final user = context.read<AuthCubit>().currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          children: [
            //logo
            Container(
              width: double.infinity,
              color: Colors.blue.shade900,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Text(
                        user!.name,
                      style: TextStyle(
                        color: ColorScheme.of(context).surface,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  )
                ],
              ),
            ),

            Divider(color: Theme.of(context).colorScheme.secondary,),

            //home tile
            MyDrawerTile(
                title: "B O O K I N G",
                icon: Icons.calendar_month_outlined,
                onTap: () => Navigator.of(context).pop
            ),

            //profile tile
            MyDrawerTile(
                title: "R O O M",
                icon: Icons.meeting_room_outlined,
                onTap: (){}
            ),

            //search tile
            MyDrawerTile(
                title: "G U E S T S",
                icon: Icons.people_alt_outlined,
                onTap: null
            ),

            MyDrawerTile(
                title: "S T A F F",
                icon: Icons.work,
                onTap: null
            ),

            //settings tile
            MyDrawerTile(
                title: "S E T T I N G S",
                icon: Icons.settings,
                onTap: null
            ),

            const Spacer(),

            //logout tile
            MyDrawerTile(
                title: "L O G O U T",
                icon: Icons.logout,
                onTap: () => context.read<AuthCubit>().logout()
            ),
          ],
        ),
      ),
    );
  }
}
