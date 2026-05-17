import 'package:flutter/material.dart';
import 'package:hmarishadi/core/constants/app_colors.dart';
import 'package:hmarishadi/utils/validators.dart';
import 'package:hmarishadi/widgets/common/common_textfield.dart';
import '../home/main_home_page.dart';

class LoginWithOTP extends StatefulWidget {
  const LoginWithOTP({super.key});

  @override
  State<LoginWithOTP> createState() => _LoginWithOTPState();
}

class _LoginWithOTPState extends State<LoginWithOTP> {
  final _formKey = GlobalKey<FormState>();
  final mobileController = TextEditingController();
  final otpController = TextEditingController();

  bool otpSent = false;

  @override
  void dispose() {
    mobileController.dispose();
    otpController.dispose();
    super.dispose();
  }

  void sendOtp() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => otpSent = true);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("OTP Sent Successfully")));
  }

  void verifyOtp() {
    if (otpController.text.length != 6) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Enter valid OTP")));
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => MainHomePage(
          title: "Hmarishadi",
          isDarkMode: Theme.of(context).brightness == Brightness.dark,
          onThemeToggle: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login with OTP"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome 💍",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                "Enter your mobile number",
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 20),

              CommonTextField(
                hint: "Enter Mobile Number",
                controller: mobileController,
                keyboard: TextInputType.phone,
                maxLength: 10,
                validator: Validator.phone,
              ),

              const SizedBox(height: 20),

              if (!otpSent)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: sendOtp,
                    child: const Text(
                      "Send OTP",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

              if (otpSent) ...[
                const SizedBox(height: 20),

                CommonTextField(
                  hint: "Enter OTP",
                  controller: otpController,
                  keyboard: TextInputType.number,
                  maxLength: 6,
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: verifyOtp,
                    child: const Text(
                      "Verify OTP",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
