import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/userController.dart';
import 'package:flutter_note/screens/auth/signup.dart';
import 'package:waveui/waveui.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.find<AuthController>();
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WaveAppBar(
        title: "Login",
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: authController.email,
                    validator: (value) {
                      return RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!)
                          ? null
                          : "Please Enter Correct Email";
                    },
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        prefixIcon: Icon(
                          FluentIcons.mail_28_regular,
                          color: Colors.grey,
                        ),
                        hintText: "EMAIL"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: authController.password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a password!';
                      } else if (value.length < 6) {
                        return "Please provide password of 5+ character ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          FluentIcons.shield_28_regular,
                          color: Colors.grey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        hintText: "PASSWORD"),
                    obscureText: true,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    child: Text("SIGN IN"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authController.login();
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New here?  ",
                  style: TextStyle(
                    // color: Colors.grey.shade900,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SignUp());
                  },
                  child: Text(
                    "Sign up instead",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
