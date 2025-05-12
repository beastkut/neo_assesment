import 'dart:convert';

class Booking {
  String name;
  String room;
  String status;
  DateTime indate;
  DateTime outdate;

  Booking({
    required this.name,
    required this.room,
    required this.status,
    required this.indate,
    required this.outdate,
  });


  //convert booking -> json
  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'room': room,
      'status' : status,
      'indate' : indate,
      'outdate' : outdate
    };
  }

  //convert json -> booking
  factory Booking.fromJson(Map<String,dynamic> jsonBooking){
    return Booking(
      name: jsonBooking['name'],
      room: jsonBooking['room'],
      status: jsonBooking['status'],
      indate:  jsonBooking['indate'].toDate(),
      outdate: jsonBooking['outdate'].toDate()

    );
  }
}