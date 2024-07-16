// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// part 'authentication_event.dart';
// part 'authentication_state.dart';
//
// class AuthenticationBloc
//     extends Bloc<AuthenticationEvent, AuthenticationState> {
//   final FirebaseAuth _firebaseAuth;
//
//   AuthenticationBloc({required FirebaseAuth firebaseAuth})
//       : _firebaseAuth = firebaseAuth,
//         super(AuthenticationInitial()) {
//     on<AuthenticationStarted>(_onAuthenticationStarted);
//     on<AuthenticationLoggedIn>(_onAuthenticationLoggedIn);
//     on<AuthenticationLoggedOut>(_onAuthenticationLoggedOut);
//   }
//
//   void _onAuthenticationStarted(
//       AuthenticationStarted event,
//       Emitter<AuthenticationState> emit,
//       ) {
//     final currentUser = _firebaseAuth.currentUser;
//     if (currentUser != null) {
//       emit(AuthenticationAuthenticated());
//     } else {
//       emit(AuthenticationUnauthenticated());
//     }
//   }
//
//   void _onAuthenticationLoggedIn(
//       AuthenticationLoggedIn event,
//       Emitter<AuthenticationState> emit,
//       ) {
//     emit(AuthenticationAuthenticated());
//   }
//
//   void _onAuthenticationLoggedOut(
//       AuthenticationLoggedOut event,
//       Emitter<AuthenticationState> emit,
//       ) async {
//     await _firebaseAuth.signOut();
//     emit(AuthenticationUnauthenticated());
//   }
// }
