import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vinove_demo/models/user_data.dart';

class APIs {
  //for authentication
  static FirebaseAuth auth = FirebaseAuth.instance;

  //for accessing the cloud firestore data
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  //to return current user
  static User get users => auth.currentUser!;

  // //for checking if user exit or not
  // static Future<bool> userExits() async {
  //   return (await firestore
  //       .collection('users')
  //       .doc(auth.currentUser!.email)
  //       .get())
  //       .exists;
  // }

//for checking a new user
  static Future<void> createUser() async {
   // final time = DateTime.now().millisecondsSinceEpoch.toString();
   if(users!=null){
     // Create a LogedInUser object with the current user's data
    final user = LogedInUser(
        name: users.displayName.toString(),
        image: users.photoURL.toString(),
        email: users.email.toString(),
    );
    // Create a LogedInUser object with the current user's data
    return await firestore
        .collection('users')
        .doc(users.email).set(user.toJson());
  }else{
     throw Exception("No logged-in user found.");
   }
   }
}