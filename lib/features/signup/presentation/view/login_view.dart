import 'package:firbase_auth/core/widgets/app_text_button.dart';
import 'package:firbase_auth/core/widgets/app_text_form_field.dart';
import 'package:firbase_auth/features/signup/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:firbase_auth/features/signup/presentation/view/home_view.dart';
import 'package:firbase_auth/features/signup/presentation/view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
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
          return state is LoginLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is LoginFailure
                  ? Center(
                      child: Text(
                        state.errMessage,
                      ),
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
                                  'Login',
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
                                  text: 'Log in',
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      context.read<LoginCubit>().login(
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
                                          return const SignupView();
                                        },
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'SIGN UP',
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
