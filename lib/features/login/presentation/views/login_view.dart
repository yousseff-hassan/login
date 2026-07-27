import 'package:fad/core/sharedWedgits/basic_button.dart';
import 'package:fad/core/sharedWedgits/basic_txt.dart';
import 'package:fad/core/sharedWedgits/basic_txt_field.dart';
import 'package:fad/features/login/data/repository/login_repo_impl.dart';
import 'package:fad/features/login/presentation/views/widgets/remember_me.dart';
import 'package:fad/features/login/presentation/viewsModel/login_cubit.dart';
import 'package:fad/features/login/presentation/viewsModel/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget _buildSocialButton({required Widget child, required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 48.w,
        height: 48.w,
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: const Color(0xFFE2E8F0),
            width: 1,
          ),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRepoImpl()),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: BasicText(
                  text: 'Welcome ${state.user.name}! Login Successful.',
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: BasicText(
                  text: state.errorMessage,
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF2563EB), 
                    Color(0xFF1E3A8A), 
                  ],
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      Container(
                        width: 60.w,
                        height: 60.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromRGBO(255, 255, 255, 0.12),
                          border: Border.all(
                            color: const Color.fromRGBO(255, 255, 255, 0.08),
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.lock_outline_rounded,
                            color: Colors.white,
                            size: 28.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      BasicText(
                        text: 'Welcome Back',
                        fontSize: 22.sp,
                        isBold: true,
                        color: Colors.white,
                      ),
                      SizedBox(height: 4.h),
                      BasicText(
                        text: 'Log in to continue your journey with us',
                        fontSize: 12.sp,
                        color: const Color.fromRGBO(255, 255, 255, 0.7),
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 12.h),
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28.r),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(0, 0, 0, 0.06),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BasicTextField(
                              label: 'Email',
                              hint: 'example@email.com',
                              controller: emailController,
                              isPassword: false,
                              prefixIcon: Icons.mail_outline_rounded,
                              labelColor: const Color(0xFF64748B),
                            ),
                            BasicTextField(
                              label: 'Password',
                              hint: '.....',
                              controller: passwordController,
                              isPassword: true,
                              prefixIcon: Icons.lock_outline_rounded,
                              labelColor: const Color(0xFF64748B),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const RememberMe(),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/forgetPassword');
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size.zero,
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: BasicText(
                                    text: 'Forgot password?',
                                    fontSize: 13.sp,
                                    color: const Color(0xFF2563EB),
                                    isBold: true,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            BasicButton(
                              onPressed: () {
                                context.read<LoginCubit>().login(
                                      email: emailController.text.trim(),
                                      password: passwordController.text,
                                    );
                              },
                              text: "Log In",
                              colors: const [
                                Color(0xFF3B82F6),
                                Color(0xFF2563EB),
                              ],
                              radius: 12.r,
                              width: double.infinity,
                              isLoading: state is LoginLoading,
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                const Expanded(
                                  child: Divider(
                                    color: Color(0xFFE2E8F0),
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                                  child: BasicText(
                                    text: 'Or log in with',
                                    fontSize: 12.sp,
                                    color: const Color(0xFF94A3B8),
                                  ),
                                ),
                                const Expanded(
                                  child: Divider(
                                    color: Color(0xFFE2E8F0),
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildSocialButton(
                                  child: BasicText(
                                    text: 'G',
                                    fontSize: 18.sp,
                                    isBold: true,
                                    color: const Color(0xFF0F172A),
                                  ),
                                  onPressed: () {},
                                ),
                                SizedBox(width: 16.w),
                                _buildSocialButton(
                                  child: Icon(
                                    Icons.apple,
                                    color: const Color(0xFF0F172A),
                                    size: 24.sp,
                                  ),
                                  onPressed: () {},
                                ),
                                SizedBox(width: 16.w),
                                _buildSocialButton(
                                  child: Icon(
                                    Icons.facebook,
                                    color: const Color(0xFF1877F2),
                                    size: 24.sp,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BasicText(
                                  text: "Don't have an account? ",
                                  fontSize: 14.sp,
                                  color: const Color(0xFF64748B),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/signup');
                                  },
                                  child: BasicText(
                                    text: 'Sign Up',
                                    fontSize: 14.sp,
                                    color: const Color(0xFF2563EB),
                                    isBold: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
