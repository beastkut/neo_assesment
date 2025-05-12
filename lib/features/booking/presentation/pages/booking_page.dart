import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_assesment/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:neo_assesment/features/booking/domain/entity/booking.dart';
import 'package:neo_assesment/features/booking/presentation/component/booking_tile.dart';
import 'package:neo_assesment/features/booking/presentation/component/my_drawer.dart';
import 'package:neo_assesment/features/booking/presentation/component/overview_tile.dart';



class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  late final user = context.read<AuthCubit>().currentUser;
  Future? _myFuture;
  List<Booking> bookingList = [];

  Future<void>getBooking() async{
    final snapshot = await FirebaseFirestore.instance.collection("booking").get();

    if(snapshot.docs.isNotEmpty){
      bookingList = snapshot.docs.map((doc) => Booking.fromJson(doc.data())).toList();
    }

    print(bookingList.length);
  }

  @override
  void initState() {
    // TODO: implement initState
    _myFuture = getBooking();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
        centerTitle: true,

        //leading: Icon(Icons.menu,color: Colors.grey.shade300,),
      ),

      drawer: MyDrawer(),

      body: FutureBuilder(
          future: _myFuture,
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back ${user!.name} ! \n How you doin",
                      style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w500
                      ),
                    ),

                    SizedBox(height: 20,),

                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          OverviewTile(
                            text: "152 \nTodays Booking",
                            icon: Icons.menu_book,
                            borderColor: Colors.transparent,
                            tileColor: Colors.blue.shade900,
                            textColor: ColorScheme.of(context).tertiary,
                            iconColor: ColorScheme.of(context).tertiary,
                          ),

                          OverviewTile(
                            text: "28 \nVacant Room",
                            icon: Icons.meeting_room_rounded,
                            borderColor: Colors.blue.shade900,
                            tileColor: Colors.transparent,
                            textColor: Colors.blue.shade900,
                            iconColor: Colors.blue.shade900,
                          ),

                          OverviewTile(
                            text: "152100 \nTotal Visitor",
                            icon: Icons.people_alt,
                            borderColor: Colors.transparent,
                            tileColor: Colors.blue.shade900,
                            textColor: ColorScheme.of(context).tertiary,
                            iconColor: ColorScheme.of(context).tertiary,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 25,),

                    Text(
                      "Upcoming booking",
                      style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w500
                      ),
                    ),

                    SizedBox(height: 20,),

                    Expanded(
                      child: ListView.builder(
                          itemCount: bookingList.length,
                          itemBuilder: (context,index){
                            return BookingTile(
                                name: bookingList[index].name,
                                room: bookingList[index].room,
                                status: bookingList[index].status,
                                inDate: bookingList[index].indate,
                                outDate: bookingList[index].outdate
                            );
                          }
                      )
                    ),
                  ],
                ),
              );
            }

            else{
              return Center(child: CircularProgressIndicator(),);
            }
          }
      )
    );
  }
}
