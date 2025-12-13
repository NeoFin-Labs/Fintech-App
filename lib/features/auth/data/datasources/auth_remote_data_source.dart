import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fintech_app/core/logger/app_logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  );
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
    String firstName,
    String lastName,
    String phone,
  );
  Future<UserCredential> signInWithGoogle();
  Future<UserCredential> signInWithFacebook();
  Future<void> resetPassword(String email);
  Future<void> logout();
  User? getCurrentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;

  AuthRemoteDataSourceImpl({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
    GoogleSignIn? googleSignIn,
    FacebookAuth? facebookAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
       _firestore = firestore ?? FirebaseFirestore.instance,
       _googleSignIn = googleSignIn ?? GoogleSignIn(),
       _facebookAuth = facebookAuth ?? FacebookAuth.instance;

  @override
  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
    String firstName,
    String lastName,
    String phone,
  ) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _firestore.collection('users').doc(userCredential.user!.uid).set({
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'photoURL': '',
    });

    return userCredential;
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    AppLogger.logInfo('Remote before signInWithGoogle');
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    AppLogger.logInfo('Remote after signInWithGoogle $googleUser');
    if (googleUser == null) {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
    AppLogger.logInfo('Remote after Google user2: $googleUser');

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    AppLogger.logInfo('Remote after Google user3: $googleUser');

    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    AppLogger.logInfo('Remote after Google user4: $userCredential');
    await _saveSocialUserToFirestore(userCredential);
    AppLogger.logInfo('Remote after Google user5: $userCredential');
    return userCredential;
  }

  @override
  Future<UserCredential> signInWithFacebook() async {
    // Request only public_profile permission (default allowed)
    // Note: 'email' permission requires Facebook App Review approval
    final LoginResult result = await _facebookAuth.login(
      permissions: ['public_profile'],
    );

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      final OAuthCredential credential = FacebookAuthProvider.credential(
        accessToken.token,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
      await _saveSocialUserToFirestore(userCredential);
      return userCredential;
    } else {
      throw FirebaseAuthException(
        code: 'ERROR_FACEBOOK_LOGIN_FAILED',
        message: result.message ?? 'Facebook login failed',
      );
    }
  }

  Future<void> _saveSocialUserToFirestore(UserCredential userCredential) async {
    final user = userCredential.user!;
    final userDoc = await _firestore.collection('users').doc(user.uid).get();
    AppLogger.logInfo('User document: $userDoc');

    if (!userDoc.exists) {
      final nameParts = user.displayName?.split(' ') ?? ['Unknown', 'User'];
      final firstName = nameParts.first;
      final lastName = nameParts.length > 1
          ? nameParts.sublist(1).join(' ')
          : '';

      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        'firstName': firstName,
        'lastName': lastName,
        'phone': user.phoneNumber ?? '',
        'photoURL': user.photoURL ?? '',
      });
    }
    AppLogger.logInfo('User document: $userDoc');
  }

  @override
  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> logout() async {
    await _googleSignIn.signOut();
    await _facebookAuth.logOut();
    return await _firebaseAuth.signOut();
  }

  @override
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
