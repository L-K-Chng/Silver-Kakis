import 'package:flutter/material.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:silverkakis1/reusable_widgets/attendance_card.dart';
import '../services/auth_methods.dart';
import './sign_up_screen.dart';
import '../utils/colours.dart';
import '../utils/utils.dart';
import 'add_data_screen.dart';

//new stuff
class EmailFieldValidator {
  static String? validate(String value){
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String? validate(String value){
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  // to hide password
  bool _isObscure = true;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AddData(homeScreen: AttendanceCard(),)));
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: SizedBox(
                    width: 1,
                    height: 64,
                  ),
                ),
                Container(
                    width: 64,
                    height: 64,
                    foregroundDecoration: const RotatedCornerDecoration(
                        color: Colors.blue,
                        geometry: BadgeGeometry(width: 64, height: 64),
                        textSpan: TextSpan(
                            text: 'ELDER',
                            style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)))),
              ],
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/silverkakis.png',
                      scale: 2,
                    ),
                    Image.asset(
                      'assets/images/Silver_Kakis_word-preview.png',
                      scale: 1.5,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    /*TextFieldInput(
                      //changed portion
                      key: Key('Email Field'),
                      hintText: 'Enter your email',
                      textInputType: TextInputType.emailAddress,
                      textEditingController: _emailController,
                    ),*/
                    //testing first
                    TextFormField(
                      key: Key('Email Field'),
                      decoration: InputDecoration(
                        labelText: 'Enter your email',
                        border: inputBorder,
                      focusedBorder: inputBorder,
                      enabledBorder: inputBorder,
                      filled: true,
                      contentPadding: const EdgeInsets.all(8),
                      ),
                      validator: (value) => EmailFieldValidator.validate(value!),
                      //onSaved: (value) => _emailController = value as TextEditingController,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 24,
                    ),

                    /*TextFieldInput(
                      //changed portion
                      key: Key('Password Field'),
                      hintText: 'Enter your password',
                      textInputType: TextInputType.text,
                      textEditingController: _passwordController,
                      isPass: true,
                    ),*/
                    //testing this out first
                    TextFormField(
                      key: Key('Password Field'),
                      decoration: InputDecoration(labelText: 'Enter your password',
                        border: inputBorder,
                        focusedBorder: inputBorder,
                        enabledBorder: inputBorder,
                        filled: true,
                        contentPadding: const EdgeInsets.all(8),
                      ),
                      //added null check
                      validator: (value) => PasswordFieldValidator.validate(value!),
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: _isObscure,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      onTap: loginUser,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          color: blueColor,
                        ),
                        child: !_isLoading
                            ? const Text(
                                'Log in',
                              )
                            : const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: const Text(
                            'Dont have an account?',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: const Text(
                              ' Signup.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
