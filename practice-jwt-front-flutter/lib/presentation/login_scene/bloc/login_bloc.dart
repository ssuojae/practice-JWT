import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/domain/entities/user_entity.dart';
import '../../../domain/repository_interfaces/user_repository.dart';
import '../events/login_event.dart';
import '../states/login_state.dart';

final class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final IUserRepository _userRepository;

  LoginBloc(this._userRepository) : super(const LoginInitial()) {
    on<LoginStarted>(_onStarted);
    on<LoginPressed>(_onLoginPressed);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
  }

  Future<void> _onStarted(LoginStarted event, Emitter<LoginState> emit) async {
    emit(const LoginInitial());
  }

  Future<void> _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(email: event.password));
  }

  Future<void> _onLoginPressed(LoginPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading(email: state.email, password: state.password));
    try {
      UserEntity user = await _userRepository.loginUser(state.email, state.password);
      emit(LoginSuccess(email: user.email, password: state.password));
    } catch (error) {
      emit(LoginFailure(error: error.toString(), email: state.email, password: state.password));
    }
  }
}