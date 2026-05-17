import 'package:flutter/material.dart';
import 'package:hmarishadi/core/constants/app_colors.dart';
import 'package:hmarishadi/utils/validators.dart';
import 'package:hmarishadi/widgets/common/common_textfield.dart';

class SignupStep2Page extends StatefulWidget {
  const SignupStep2Page({super.key});

  @override
  State<SignupStep2Page> createState() => _SignupStep2PageState();
}

class _SignupStep2PageState extends State<SignupStep2Page> {
  final _formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final dobController = TextEditingController();

  bool isLoading = false;
  bool isPasswordVisible = false;
  DateTime? selectedDate;

  @override
  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    passController.dispose();
    dobController.dispose();
    super.dispose();
  }

  /// 📅 Date picker
  Future<void> pickDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      initialDate: DateTime(2000),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
        // Format: MM/DD/YYYY
        dobController.text = "${date.month}/${date.day}/${date.year}";
      });
    }
  }

  /// 🔹 Register logic
  Future<void> registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registration Completed 🎉"),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e"), backgroundColor: Colors.red),
      );
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Profile - Step 2"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 📱 Phone
              CommonTextField(
                hint: "Phone Number",
                controller: phoneController,
                keyboard: TextInputType.phone,
                maxLength: 10,
                validator: Validator.phone,
              ),

              const SizedBox(height: 15),

              /// 🖼 Photo upload (Using same styling)
              const Text(
                "Profile Photo",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Photo picker coming soon 📷"),
                        ),
                      );
                    },
                    icon: const Icon(Icons.image, size: 18),
                    label: const Text("Choose File"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      foregroundColor: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "No file chosen",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              /// 🎂 DOB (CommonTextField with Calendar Icon)
              GestureDetector(
                onTap: pickDate, // Box pe click karne par bhi picker khulega
                child: AbsorbPointer(
                  child: CommonTextField(
                    hint: "Date of Birth",
                    controller: dobController,
                    validator: (val) =>
                        val == null || val.isEmpty ? "Please select DOB" : null,
                    suffixIcon: const Icon(Icons.calendar_today, size: 20),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              /// 📧 Email
              CommonTextField(
                hint: "Email Address",
                controller: emailController,
                keyboard: TextInputType.emailAddress,
                validator: (val) {
                  if (val == null || val.isEmpty) return "Email required";
                  if (!val.contains("@")) return "Enter valid email";
                  return null;
                },
              ),

              const SizedBox(height: 15),

              /// 🔒 Password
              CommonTextField(
                hint: "Create Password",
                controller: passController,
                obscureText: !isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () =>
                      setState(() => isPasswordVisible = !isPasswordVisible),
                ),
                validator: Validator.password,
              ),

              const SizedBox(height: 30),

              /// 🟥 Register button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.primary, // Using your global color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: isLoading ? null : registerUser,
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
