import 'package:ch9_shared/student_screen.dart';
import 'package:ch9_shared/teacher_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final agecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(hintText: 'Enter Email'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordcontroller,
                decoration: InputDecoration(hintText: 'Enter Password'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: agecontroller,
                decoration: InputDecoration(hintText: 'Enter Age'),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('email', emailcontroller.text.toString());
                  sp.setString('age', agecontroller.text.toString());
                  //admin, student, Teacher
                  sp.setString('usertype', 'Teacher');
                  sp.setBool('isLogin', true);
                  if (sp.getString('usertype') == 'Teacher') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeacherScreen(),
                        ));
                  } else if (sp.getString('usertype') == 'Student') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentScreen(),
                        ));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentScreen(),
                        ));
                  }
                },
                child: Container(
                  color: Colors.orange,
                  height: 50,
                  width: double.infinity,
                  child: Center(child: Text('Sign up')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
