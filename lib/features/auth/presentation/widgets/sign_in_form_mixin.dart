import '../../../../product/utility/extensions/future_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/auth_model.dart';
import '../providers/provider.dart';
import 'sign_in_form.dart';

mixin SignInFormMixin on ConsumerState<SignInForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final double inputFieldWidth = 300;

  @override
  void initState() {
    emailController.text = "m.emrec45@gmail.com";
    passwordController.text = "Emre170495.";
    WidgetsBinding.instance.addPostFrameCallback((_) {
      signIn();
    });
    signIn();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;
      final authModel = AuthModel(email: email, password: password);
      await ref
          .read(authViewModelProvider)
          .signInWithEmailAndPassword(authModel)
          .showLoading(context: context);
    }
  }
}
