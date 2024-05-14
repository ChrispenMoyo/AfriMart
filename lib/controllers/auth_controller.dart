import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerNewUser(
      String email, String fullname, String password) async {
    String res = ' Something went Wrong.';

    try {
      //creating user in the Authentication tab and then later in firestore

      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await _firestore.collection('buyers').doc(userCredential.user!.uid).set({
        'fullname': fullname,
        'profileImage': "",
        'email': email,
        'uid': userCredential.user!.uid,
        'pinCode': "",
        'locality': "",
        'city': "",
        'state': "",
      });
      res = 'Successful.';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
  // Login User

  Future<String> loginUser(String email, String password) async {
    String res = 'Something went wrong.';

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      res = "Successful.";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
