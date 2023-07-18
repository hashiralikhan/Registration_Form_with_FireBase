// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:formregidtration/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final _formKey = GlobalKey<FormState>();
final  TextEditingController _usernameController = TextEditingController();
final  TextEditingController _emailController = TextEditingController();
final  TextEditingController _passwordController = TextEditingController();
final  TextEditingController _ageController = TextEditingController();
final  TextEditingController _genderController = TextEditingController();
final  TextEditingController _qualificationController = TextEditingController();
final  TextEditingController _cellNoController = TextEditingController();
final  TextEditingController _dobController = TextEditingController();
final  TextEditingController _firstNameController = TextEditingController();
 final TextEditingController _lastNameController = TextEditingController();
 final TextEditingController _cnicController = TextEditingController();

  void _registerUser() async{
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      int age = int.tryParse(_ageController.text) ?? 0;
      String gender = _genderController.text;
      String qualification = _qualificationController.text;
      String cellNo = _cellNoController.text;
      String dob = _dobController.text;
      String firstName = _firstNameController.text;
      String lastName = _lastNameController.text;
      String cnic = _cnicController.text;

      // Store user data in Firestore
            FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      final UserCredential credential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await firestore.collection('data').doc(credential.user!.uid).set({
        'username': username,
        'email': email,
        'password': password,
        'age': age,
        'gender': gender,
        'qualification': qualification,
        'cellNo': cellNo,
        'dob': dob,
        'firstName': firstName,
        'lastName': lastName,
        'cnic': cnic,
      });

      // Show success message or navigate to another screen
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Registration Successful'),
          content:const Text('User registered successfully!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder:(context){
                  return LoginPage();
                } )),
              child:const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
      ),
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration:const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
            const  SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                decoration:const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // You can add more validation for the email format
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Age'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  // Add more age validation if needed
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _genderController,
                decoration: InputDecoration(labelText: 'Gender'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your gender';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _qualificationController,
                decoration: InputDecoration(labelText: 'Qualification'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your qualification';
                  }
                  return null;
                },
              ),
            const  SizedBox(height: 12),
              TextFormField(
                controller: _cellNoController,
                keyboardType: TextInputType.phone,
                decoration:const InputDecoration(labelText: 'Cell No.'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your cell number';
                  }
                  return null;
                },
              ),
            const  SizedBox(height: 12),
              TextFormField(
                controller: _dobController,
                decoration:const InputDecoration(labelText: 'Date of Birth'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your date of birth';
                  }
                  // Add more date of birth validation if needed
                  return null;
                },
              ),
             const SizedBox(height: 12),
              TextFormField(
                controller: _firstNameController,
                decoration:const InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
            const  SizedBox(height: 12),
              TextFormField(
                controller: _lastNameController,
                decoration:const InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
             const SizedBox(height: 12),
              TextFormField(
                controller: _cnicController,
                decoration:const InputDecoration(labelText: 'CNIC No.'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your CNIC number';
                  }
                  // Add more CNIC validation if needed
                  return null;
                },
              ),
             const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _registerUser,
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


















//   final TextEditingController emailController = TextEditingController();

//   final TextEditingController dobController = TextEditingController();

//   final TextEditingController nameController = TextEditingController();

//   final TextEditingController phoneNumberController = TextEditingController();

//   final TextEditingController passController = TextEditingController();

//   void buttonregister() async {
//     final dynamic birthDate = dobController.text;
//     final dynamic email = emailController.text;
//     final dynamic password = passController.text;
//     final String name = nameController.text;
//     final dynamic phoneNo = phoneNumberController.text;
//     try {
      // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      // FirebaseFirestore firestore = FirebaseFirestore.instance;

      // final UserCredential credential = await firebaseAuth
      //     .createUserWithEmailAndPassword(email: email, password: password);
      // await firestore.collection('data').doc(credential.user!.uid).set({
//         'name': name,
//         'email': email,
//         "Date-of-Birth": birthDate,
//         "Cell_No": phoneNo
//       });
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) {
//           return const LoginPage();
//         },
//       ));
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Registration Form'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Form(
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 TextFormField(
//                   controller: nameController,
//                   decoration: const InputDecoration(
//                     icon: Icon(Icons.person),
//                     hintText: 'Enter your name',
//                     labelText: 'Name',
//                   ),
//                 ),
//                 TextFormField(
//                   controller: phoneNumberController,
//                   decoration: const InputDecoration(
//                     icon: Icon(Icons.phone),
//                     hintText: 'Enter a phone number',
//                     labelText: 'Phone',
//                   ),
//                 ),
//                 TextFormField(
//                   controller: dobController,
//                   decoration: const InputDecoration(
//                     icon: Icon(Icons.calendar_today),
//                     hintText: 'Enter your date of birth',
//                     labelText: 'Dob',
//                   ),
//                 ),
//                 TextFormField(
//                   controller: passController,
//                   decoration: const InputDecoration(
//                     icon: Icon(Icons.password_outlined),
//                     hintText: 'Enter your password',
//                     labelText: 'pass',
//                   ),
//                 ),
//                 TextFormField(
//                   controller: emailController,
//                   decoration: const InputDecoration(
//                     icon: Icon(Icons.email_outlined),
//                     hintText: 'Enter your Email',
//                     labelText: '@gmail.com',
//                   ),
//                 ),
//                 Container(
//                     padding: const EdgeInsets.only(left: 150.0, top: 40.0),
//                     child: ElevatedButton(
//                         onPressed: buttonregister,
//                         child: const Text("submit"))),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
