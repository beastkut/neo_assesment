import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class BookingTile extends StatelessWidget {
  final String name;
  final String room;
  final String status;
  final DateTime inDate;
  final DateTime outDate;
  const BookingTile({
    super.key,
    required this.name,
    required this.room,
    required this.status,
    required this.inDate,
    required this.outDate
  });

  @override
  Widget build(BuildContext context) {
    String checkIn = DateFormat('dd/MM/yyyy').format(inDate);
    String checkOut = DateFormat('dd/MM/yyyy').format(outDate);


    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.blue.shade800,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                ),

                child: Center(
                  child: Text(
                    room,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 5,),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // name
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                          ),
                        ),

                        // status
                        Text(
                          status,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: status == "Confirmed" ? Colors.green : status == "Cancelled" ? Colors.red.shade500 : Colors.yellow.shade500
                          ),
                        ),
                      ],
                    ),

                    // check in date
                    Text(
                      "Check in date : $checkIn",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    ),

                    // checkout date
                    Text(
                      "Checkout date : $checkOut",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    )


                  ],
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}
