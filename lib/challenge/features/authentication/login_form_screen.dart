import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok/challenge/features/authentication/view_models/login_view_model.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/widgets/form_button.dart';
import 'package:tiktok/features/onboarding/interests_screen.dart';

class CLoginFormScreen extends ConsumerStatefulWidget {
  const CLoginFormScreen({super.key});

  @override
  ConsumerState<CLoginFormScreen> createState() => _CLoginFormScreenState();
}

/*
Global key 
1. 고유 식별자
2. Form의 state나 메서드를 실행 가능
 */

class _CLoginFormScreenState extends ConsumerState<CLoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> _formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        // formField의 onSaved 함수 발동
        _formKey.currentState!.save();
        // Navigator.of(context).pushAndRemoveUntil(
        //     MaterialPageRoute(
        //       builder: (context) => const InterestsScreen(),
        //     ), ((route) {
        //   return false;
        // }));
        ref.read(loginProvider.notifier).login(
            _formData['email'] ?? "", _formData['password'] ?? "", context);
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
                    decoration: const InputDecoration(
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
                        _formData['email'] = newValue;
                      }
                    },
                  ),
                  Gaps.v16,
                  TextFormField(
                    decoration: const InputDecoration(
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
                        _formData['password'] = newValue;
                      }
                    },
                  ),
                  Gaps.v28,
                  GestureDetector(
                    onTap: _onSubmitTap,
                    child: FormButton(
                        disabled: ref.watch(loginProvider).isLoading),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
