import 'package:firbase_auth/core/widgets/app_text_button.dart';
import 'package:firbase_auth/core/widgets/app_text_form_field.dart';
import 'package:firbase_auth/features/signup/presentation/cubits/signup_cubit/sign_up_cubit.dart';
import 'package:firbase_auth/features/signup/presentation/view/home_view.dart';
import 'package:firbase_auth/features/signup/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const HomeView();
                },
              ),
            );
          }
        },
        builder: (context, state) {
          return state is SignUpLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is SignUpFailure
                  ? Center(
                      child: Text(state.errMessage),
                    )
                  : Scaffold(
                      body: SingleChildScrollView(
                        child: SafeArea(
                            child: Form(
                          key: formKey,
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              children: [
                                const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 160,
                                ),
                                AppTextFormField(
                                  controller: emailController,
                                  hintText: 'email',
                                  validator: (value) {},
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                AppTextFormField(
                                  controller: passwordController,
                                  hintText: 'password',
                                  validator: (value) {},
                                ),
                                const SizedBox(
                                  height: 100,
                                ),
                                AppTextButton(
                                  text: 'Sign Up',
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      context.read<SignUpCubit>().signUp(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const LoginView();
                                        },
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                      ),
                    );
        },
      ),
    );
  }
}
