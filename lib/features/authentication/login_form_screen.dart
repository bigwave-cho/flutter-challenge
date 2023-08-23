import 'package:flutter/material.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/widgets/form_button.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

/*
Global key 
1. 고유 식별자
2. Form의 state나 메서드를 실행 가능
 */

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        // formField의 onSaved 함수 발동
        _formKey.currentState!.save();

        debugPrint('$formData');
      }
    }
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Log in'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: (value) {
                      // string 반환하면 validate false
                      // null 반환하면 validate가 true
                      // return "i don't like your email";
                      return null;
                    },
                    onSaved: (newValue) {
                      debugPrint(newValue);
                      if (newValue != null) {
                        formData['email'] = newValue;
                      }
                    },
                  ),
                  Gaps.v16,
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                    validator: (value) {
                      //여기서 유효성 검사 거치면 formKey의 validate에서 여기 뱉는걸 뱉어줌.
                      // return "i don't like your password";
                      return null;
                    },
                    onSaved: (newValue) {
                      debugPrint(newValue);
                      if (newValue != null) {
                        formData['password'] = newValue;
                      }
                    },
                  ),
                  Gaps.v28,
                  GestureDetector(
                    onTap: _onSubmitTap,
                    child: const FormButton(disabled: false),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
