import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class SimplexAuthUser {
  SimplexAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  DtUserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<SimplexAuthUser> simplexAuthUserSubject =
    BehaviorSubject.seeded(SimplexAuthUser(loggedIn: false));
Stream<SimplexAuthUser> simplexAuthUserStream() => simplexAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
