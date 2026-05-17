import 'package:flutter/material.dart';
import 'package:hmarishadi/screens/auth/signup_step2_page.dart';
import 'package:hmarishadi/widgets/common/commom_button.dart';
import 'package:hmarishadi/widgets/common/common_textfield.dart';
import 'package:hmarishadi/widgets/common/selection_button.dart';

class SignupStep1Page extends StatefulWidget {
  const SignupStep1Page({super.key});

  @override
  State<SignupStep1Page> createState() => _SignupStep1PageState();
}

class _SignupStep1PageState extends State<SignupStep1Page> {
  final _formKey = GlobalKey<FormState>();

  String? profileFor;
  String? gender;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  bool isLoading = false;

  final List<String> profileOptions = [
    "Myself",
    "Son",
    "Daughter",
    "Brother",
    "Sister",
    "Friend",
    "Relative",
  ];

  final List<String> genderOptions = ["Male", "Female"];

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  Future<void> goNext() async {
    if (profileFor == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select profile for")),
      );
      return;
    }

    if (gender == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please select gender")));
      return;
    }

    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    await Future.delayed(const Duration(milliseconds: 500));

    setState(() => isLoading = false);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SignupStep2Page()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Profile"), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// Logo
              Image.asset('assets/images/Hmarisadi-logo1.png', height: 40),

              const SizedBox(height: 40),

              Text(
                "I am creating this profile for",
                style: Theme.of(context).textTheme.titleMedium,
              ),

              const SizedBox(height: 16),

              /// Profile selection
              Wrap(
                alignment: WrapAlignment.center,
                children: profileOptions
                    .map(
                      (e) => SelectionButton(
                        text: e,
                        isSelected: profileFor == e,
                        onTap: () => setState(() => profileFor = e),
                      ),
                    )
                    .toList(),
              ),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Gender",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),

              const SizedBox(height: 10),

              Wrap(
                children: genderOptions
                    .map(
                      (e) => SelectionButton(
                        text: e,
                        isSelected: gender == e,
                        onTap: () => setState(() => gender = e),
                      ),
                    )
                    .toList(),
              ),

              const SizedBox(height: 20),

              /// Name fields
              Row(
                children: [
                  Expanded(
                    child: CommonTextField(
                      hint: "First Name",
                      controller: firstNameController,
                      validator: (val) =>
                          val == null || val.isEmpty ? "Required" : null,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CommonTextField(
                      hint: "Last Name",
                      controller: lastNameController,
                      validator: (val) =>
                          val == null || val.isEmpty ? "Required" : null,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// Button
              CommonButton(
                text: "Start Registration",
                isLoading: isLoading,
                onPressed: goNext,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
