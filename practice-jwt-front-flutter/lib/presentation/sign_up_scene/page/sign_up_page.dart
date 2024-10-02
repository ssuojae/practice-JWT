import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../bloc/sign_up_bloc.dart';
import '../events/sign_up_event.dart';
import '../states/sign_up_state.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<SignUpBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<SignUpBloc, SignUpState>(
            listener: (context, state) {
              if (state is SignUpFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Sign Up failed: ${state.error}')),
                );
              } else if (state is SignUpSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sign Up successful!')),
                );
              }
            },
            builder: (context, state) {
              if (state is SignUpLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return _buildSignUpForm(context);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpForm(BuildContext context) {
    final bloc = BlocProvider.of<SignUpBloc>(context);

    return Column(
      children: [
        TextField(
          onChanged: (email) => bloc.add(SignUpEvent.emailChanged(email)),
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        TextField(
          onChanged: (password) => bloc.add(SignUpEvent.passwordChanged(password)),
          obscureText: true,
          decoration: const InputDecoration(labelText: 'Password'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => bloc.add(const SignUpEvent.signUpPressed()),
          child: const Text('Sign Up'),
        ),
      ],
    );
  }
}
