import 'dart:typed_data';

import 'package:capygram/resources/auth_methods.dart';
import 'package:capygram/screens/login_screen.dart';
import 'package:capygram/utils/colors.dart';
import 'package:capygram/utils/utils.dart';
import 'package:capygram/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _bioController = TextEditingController();
  final _usernmaeController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernmaeController.dispose();
    super.dispose();
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    try {
      setState(() {
        _image = img;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernmaeController.text,
      bio: _bioController.text,
      file: _image!,
    );
    setState(() {
      _isLoading = false;
    });
    if (res == "success") {
      showSnackbar(context, "Yay! Your account has been created");
    } else {
      showSnackbar(context, res);
    }
  }

  navigateToLogin() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginScreen() ,));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: ListView(
            children: [
              // Svg Image
              SvgPicture.asset(
                "assets/capygram_svg.svg",
                color: Colors.white,
                height: 235,
              ),
              // Circular widget to accept and show our selected file
              Center(
                child: Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 50, backgroundImage: MemoryImage(_image!))
                        : const CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                "https://180dc.org/wp-content/uploads/2016/08/default-profile.png"),
                          ),
                    Positioned(
                      bottom: -10,
                      left: 60,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(Icons.add_a_photo_outlined),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 48),
              // Text input for usernmae
              CustomTextfield(
                textEditingController: _usernmaeController,
                hintText: "Enter your username",
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 24),
              // Text input for email
              CustomTextfield(
                textEditingController: _emailController,
                hintText: "Enter your email",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),
              // Text input for password
              CustomTextfield(
                textEditingController: _passwordController,
                hintText: "Enter your password",
                textInputType: TextInputType.visiblePassword,
                isPass: true,
              ),
              const SizedBox(height: 24),
              // Text input for bio
              CustomTextfield(
                textEditingController: _bioController,
                hintText: "Enter your bio",
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 24),
              // Button Login
              InkWell(
                onTap: signUpUser,
                child: Container(
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : Text("Sign up"),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: blueColor,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Transitioning to signing up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("You already have an account? "),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: navigateToLogin,
                    child: Container(
                      child: const Text(
                        "Login.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
