import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/userController.dart';
import 'package:waveui/waveui.dart';

class SignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.find<AuthController>();
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WaveAppBar(
        title: "Sign up",
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          FluentIcons.person_28_regular,
                          color: Colors.grey,
                        ),
                        hintText: "NAME",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(),
                      ),
                      controller: authController.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a username!';
                        } else if (value.length < 6) {
                          return "Please provide a username of 5+ character";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (value) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!)
                            ? null
                            : "Please Enter Correct Email";
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          FluentIcons.mail_28_regular,
                          color: Colors.grey,
                        ),
                        hintText: "EMAIL",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      controller: authController.email,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
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
                        hintText: "PASSWORD",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      obscureText: true,
                      controller: authController.password,
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
                      child: Text("SIGN UP"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          authController.createUser();
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
                    "Already a member? ",
                    style: TextStyle(
                      // color: Colors.grey.shade900,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      "Sign in",
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
      ),
    );
  }
}
