import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/challenge/features/authentication/confirmation_code_screen.dart';
import 'package:tiktok/challenge/features/authentication/customize_screen.dart';
import 'package:tiktok/challenge/features/authentication/view_models/signup_view_model.dart';
import 'package:tiktok/challenge/features/onboarding/second_interests_screen.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static String routeURL = '/signup';

  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

/*
Global key 
1. 고유 식별자
2. Form의 state나 메서드를 실행 가능
 */

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isFormValid = false;

  Map<String, String> formData = {};

  final TextEditingController _birthdayController = TextEditingController();

  DateTime initialDate = DateTime(DateTime.now().year - 12);

  final regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final FocusNode _birthDayFocusNode = FocusNode();

  bool _showDatePicker = false;

  void _checkFormValidity() {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      setState(() {
        _isFormValid = isValid;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _birthDayFocusNode.addListener(
      () {
        // if (_birthdayController.text.isNotEmpty) {
        //   formData['birthday'] = _birthdayController.text;
        // }
        if (_birthDayFocusNode.hasFocus) {
          _showDatePicker = true;
        } else {
          _showDatePicker = false;
        }

        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        // formField의 onSaved 함수 발동
        _formKey.currentState!.save();
        debugPrint('$formData');

        // 이런식으로 state를 바깥에서 수정 가능하게 됨.
        final state = ref.read(signUpForm.notifier).state;

        ref.read(signUpForm.notifier).state = {
          ...state,
          "email": formData['email'],
          "name": formData['name'],
          "password": formData['password'],
          "birthday": formData['birthday'],
        };

        ref.read(signUpProvider.notifier).signUp(context);

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ConfirmationCodeScreen(data: formData),
        //   ),
        // );
      }
    }
  }

  bool isAgree = false;

  void _onNextTap() async {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        // formField의 onSaved 함수 발동
        _formKey.currentState!.save();
        _showDatePicker = false;

        isAgree = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CustomizeScreen(),
          ),
        );

        setState(() {});

        debugPrint('$formData');
      }
    }
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _goBackToPrevScreen() {
    Navigator.pop(context);
  }

  bool isNameValid = false;
  bool isEmailValid = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.blue.shade300,
            size: Sizes.size40,
          ),
          centerTitle: true,
          leadingWidth: 100,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: _goBackToPrevScreen,
                child: const Text(
                  'cancel',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Create your account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: _formKey,
                onChanged: _checkFormValidity,
                child: Column(
                  children: [
                    TextFormField(
                      readOnly: isAgree,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        suffixIcon: isNameValid
                            ? const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            : null,
                      ),
                      validator: (value) {
                        // string 반환하면 validate false
                        // null 반환하면 validate가 true
                        // return "i don't like your email";

                        if (value == null) {
                          return '이름채워라';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        debugPrint(newValue);
                        if (newValue != null) {
                          formData['name'] = newValue;
                        }
                      },
                      onChanged: (value) {
                        if (value.length > 2) {
                          isNameValid = true;
                        } else {
                          isNameValid = false;
                        }
                        setState(() {});
                      },
                    ),
                    Gaps.v16,
                    TextFormField(
                      readOnly: isAgree,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Phone number or email address',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        suffixIcon: isEmailValid
                            ? const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            : null,
                      ),
                      onChanged: (value) {
                        if (regExp.hasMatch(value)) {
                          isEmailValid = true;
                        } else {
                          isEmailValid = false;
                        }
                        setState(() {});
                      },
                      validator: (value) {
                        //여기서 유효성 검사 거치면 formKey의 validate에서 여기 뱉는걸 뱉어줌.
                        // return "i don't like your password";
                        if (value != null && regExp.hasMatch(value)) {
                          return null;
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        debugPrint(newValue);
                        if (newValue == null) return;
                        formData['email'] = newValue;
                      },
                    ),
                    //password
                    TextFormField(
                      readOnly: isAgree,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'password',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        // suffixIcon: isEmailValid
                        //     ? const Icon(
                        //         Icons.check_circle,
                        //         color: Colors.green,
                        //       )
                        //     : null,
                      ),
                      onChanged: (value) {},
                      validator: (value) {
                        if (value != null) {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        if (newValue == null) return;
                        formData['password'] = newValue;
                      },
                    ),
                    Gaps.v16,
                    TextFormField(
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData['birthday'] = newValue;
                        }
                      },
                      readOnly: true,
                      focusNode: _birthDayFocusNode,
                      controller: _birthdayController,
                      decoration: InputDecoration(
                        hintText: 'Date of Birth',
                        suffixIcon: _birthdayController.text.isNotEmpty
                            ? const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            : null,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),
                    Gaps.v28,
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: isAgree
              ? GestureDetector(
                  onTap: () {
                    //여기서도 validate 확인하고 다음 화면 가기
                    debugPrint('가즈아');
                  },
                  child: Container(
                    height: 70,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: GestureDetector(
                      onTap: _onSubmitTap,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: ref.watch(signUpProvider).isLoading
                            ? CircularProgressIndicator()
                            : const Text(
                                'Sign up!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: _onNextTap,
                      child: Container(
                        margin: const EdgeInsets.only(right: 30),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(99),
                          color: _isFormValid ? Colors.black : Colors.grey,
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color:
                                  _isFormValid ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: _showDatePicker ? 300 : 0.1,
                      child: CupertinoDatePicker(
                        onDateTimeChanged: _setTextFieldDate,
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: initialDate,
                        maximumDate: initialDate,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
