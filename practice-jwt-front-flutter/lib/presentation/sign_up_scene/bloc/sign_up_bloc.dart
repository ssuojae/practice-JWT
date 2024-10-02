import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/domain/entities/user_entity.dart';
import '../../../domain/repository_interfaces/user_repository.dart';
import '../events/sign_up_event.dart';
import '../states/sign_up_state.dart';

final class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final IUserRepository _userRepository;

  SignUpBloc(this._userRepository) : super(const SignUpInitial()) {
    on<SignUpStarted>(_onStarted);
    on<SignUpPressed>(_onSignUpPressed);
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
  }

  Future<void> _onStarted(SignUpStarted event, Emitter<SignUpState> emit) async {
    emit(const SignUpInitial());
  }

  Future<void> _onEmailChanged(SignUpEmailChanged event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _onPasswordChanged(SignUpPasswordChanged event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onSignUpPressed(SignUpPressed event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading(email: state.email, password: state.password));
    try {
      UserEntity user = await _userRepository.registerUser(state.email, state.password);
      emit(SignUpSuccess(email: user.email, password: state.password));
    } catch (error) {
      emit(SignUpFailure(error: error.toString(), email: state.email, password: state.password));
    }
  }
}
