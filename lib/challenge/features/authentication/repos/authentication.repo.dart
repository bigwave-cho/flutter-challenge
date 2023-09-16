import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationRepository {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool get isLoggendIn => user != null;

  User? get user => _firebaseAuth.currentUser;

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  Future<void> signUp(String email, password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  signOut() async {
    await _firebaseAuth.signOut();
  }
}

final authRepo = Provider((ref) => AuthenticationRepository());

final authState = StreamProvider(
  (ref) {
    final repo = ref.read(authRepo);
    return repo.authStateChanges();
  },
);


/*
final authRepo = Provider((ref) => AuthenticationRepository());
 이 코드 라인은 Riverpod 패키지를 사용하여 AuthenticationRepository 클래스의 인스턴스를 제공하는 Provider를 생성합니다.
 
이렇게 하면 여러 장점이 있습니다:

의존성 주입 (Dependency Injection): 이렇게 생성한 authRepo Provider를 사용하면,
 앱의 어느 곳에서나 AuthenticationRepository의 인스턴스를 쉽게 접근할 수 있습니다.
 이를 통해 클래스 또는 위젯 간의 느슨한 결합이 가능해지며, 코드 재사용성과 테스트 용이성이 증가합니다.

상태 관리: Riverpod는 상태 관리를 단순화하고, 상태 변경을 감지하여 관련 위젯을 자동으로 다시 빌드할 수 있게 돕습니다.
 Provider를 사용하면 상태 관리를 보다 효율적으로 할 수 있습니다.

테스트와 유지보수: Provider를 사용하면 단위 테스트와 통합 테스트를 수행할 때, 모의 객체(Mock Objects)를 쉽게 주입할 수 있어 테스트가 더 간단해집니다. 
또한 유지보수도 용이해집니다.

만약 Provider를 사용하지 않고 직접 AuthenticationRepository의 인스턴스를 생성한다면, 위에 언급된 장점들을 활용할 수 없게 됩니다.
 또한, 객체의 생성과 관리에 대한 추가적인 코드가 필요할 수 있으며, 이로 인해 코드의 복잡성이 증가할 수 있습니다.

따라서, final authRepo = Provider((ref) => AuthenticationRepository());와 같이 Provider를 사용하는 것은 Flutter 앱 개발에 있어서 효율적이고 관리하기 쉬운 코드를 작성할 수 있는 방법이라 할 수 있습니다.
 */