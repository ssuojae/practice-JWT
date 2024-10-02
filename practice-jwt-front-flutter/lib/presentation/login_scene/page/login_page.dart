import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../bloc/login_bloc.dart';
import '../events/login_event.dart';
import '../states/login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<LoginBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Login failed: ${state.error}')),
                );
              } else if (state is LoginSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Login successful!')),
                );
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return _buildLoginForm(context);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context);

    return Column(
      children: [
        TextField(
          onChanged: (email) => bloc.add(LoginEvent.emailChanged(email)),
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        TextField(
          onChanged: (password) => bloc.add(LoginEvent.passwordChanged(password)),
          obscureText: true,
          decoration: const InputDecoration(labelText: 'Password'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => bloc.add(const LoginEvent.loginPressed()),
          child: const Text('Login'),
        ),
      ],
    );
  }
}
