import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qaf_store/features/screens/sign_up/data/model/user_model.dart';
import 'package:qaf_store/network/services/user/user_service.dart';

class UserServiceImpl implements UserService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  UserServiceImpl({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _auth = auth ?? FirebaseAuth.instance;

  String? get _currentUserId => _auth.currentUser?.uid;

  @override
  Future<void> createUser(UserModel userModel) async {
    await _firestore
        .collection('users')
        .doc(userModel.id)
        .set(userModel.toJson());
  }

  @override
  Future<bool> userExists(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    return doc.exists;
  }

  @override
  Future<UserModel> fetchUserDetails() async {
    final User? user = _auth.currentUser;

    if (user == null) {
      throw Exception("User is not logged in");
    }

    final documentSnapshot =
        await _firestore.collection('users').doc(user.uid).get();

    if (!documentSnapshot.exists) {
      throw Exception("User data not found");
    }

    return UserModel.fromSnapshot(documentSnapshot);
  }

  @override
  Future<void> updateUserDetails(UserModel userModel) async {
    await _firestore
        .collection('users')
        .doc(userModel.id)
        .update(userModel.toJson());
  }

  @override
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    if (_currentUserId == null) {
      throw Exception("User is not logged in");
    }

    await _firestore.collection('users').doc(_currentUserId).update(json);
  }

  @override
  Future<void> removeUserRecord(String uId) async {
    await _firestore.collection('users').doc(uId).delete();

    final currentUser = _auth.currentUser;
    if (currentUser != null && currentUser.uid == uId) {
      await currentUser.delete();
    }
  }

  @override
  Future<void> reAuthenticateEmailAndPassword(
      String email, String password) async {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      throw Exception("User is not logged in");
    }

    final AuthCredential authCredential =
        EmailAuthProvider.credential(email: email, password: password);

    await currentUser.reauthenticateWithCredential(authCredential);
  }

  String? get currentUserId => _auth.currentUser?.uid;
}
