import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit){ print('LoginEvent received'); // Debug log
      emit(Authenticated());
      print('State set to Authenticated');}); // Debug log});
    on<LogoutEvent>((event, emit) => emit(Unauthenticated()));
  }

  
}
