// ignore_for_file: must_be_immutable, deprecated_member_use, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_states.dart';
import 'package:gss/presentation/screens/sign_in/widgets/sign_in_background_widget.dart';
import 'package:gss/presentation/screens/sign_in/widgets/sign_in_body_widget.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  String? _res;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInBloc, LogInStates>(
      listener: (context, state) {
        if(state is ValidatePhoneLoginStates){
          _res=state.res;
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: [
                const SignInBackgroundWidget(),
                ///Don't check here , jst send a value what we need
                SignInBodyWidget(res:_res),
              ],
            ),
          ),
        );
      },
    );
  }
}
