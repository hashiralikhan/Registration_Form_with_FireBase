import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class New extends StatefulWidget {
  const New({super.key});
  

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {

 FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _qualificationController = TextEditingController();
  TextEditingController _cellNoController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _cnicController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch and set the user's data when the page is loaded
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot =
          await _firestore.collection('data').doc(user.uid).get();
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        setState(() {
          _usernameController.text = data['username'];
          _emailController.text = data['email'];
          _ageController.text = data['age'].toString();
          _genderController.text = data['gender'];
          _qualificationController.text = data['qualification'];
          _cellNoController.text = data['cellNo'];
          _dobController.text = data['dob'];
          _firstNameController.text = data['firstName'];
          _lastNameController.text = data['lastName'];
          _cnicController.text = data['cnic'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
              enabled: false,
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              enabled: false,
            ),
            // Add more TextFormFields for other user information
          ],
        ),
      ),
    );
  }
}











//   void initState() {
//     super.initState();
//     getName();
//   }
// var name='hello';
// String uid="";
// getName()async{
//    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//       FirebaseFirestore firestore=FirebaseFirestore.instance;
    
      
      
//                  uid =firebaseAuth.currentUser!.uid;

      
//        DocumentSnapshot rabia= await firestore.collection("data").doc(uid).get();
// setState(() {
//   name=rabia["name"];
// });
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(name),
//             ElevatedButton(onPressed: getName, child: const Text('Display'))
//           ],
//         ),
//       ),
//     );
//   }
// }