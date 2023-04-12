//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import '../models/user.dart';
//
// class MyProvider extends ChangeNotifier{
//   MyUser? myUser ;
//   User? firebaseUser;
//   int c = 0;
//   String message = '';
//   MyProvider(){
//     firebaseUser = FirebaseAuth.instance.currentUser;
//     if(firebaseUser != null){
//       initUser();
//     }
//   }
//
//   void initUser()async{
//     myUser = await DatabaseUtils.readUserFromFirestore(firebaseUser?.uid??'');
//   }
//
//
//
//
//
//
//
//
// }