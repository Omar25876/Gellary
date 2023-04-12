


import '../../../base.dart';
import 'login_navigator.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  // var auth = FirebaseAuth.instance;
  // String message = "";
  //
  // void login(String email, String password) async {
  //   try {
  //     navigator!.showLoading();
  //     final credential = await auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     MyUser? myUser = await DatabaseUtils.readUserFromFirestore(credential.user?.uid ?? "");
  //     message = "Successfully logged";
  //     if (myUser != null) {
  //       navigator!.hideLoading();
  //       navigator!.goToHome(myUser);
  //       return;
  //     }
  //
  //   } on FirebaseAuthException catch (e) {
  //     message = "wrong email or password";
  //   } catch (e) {
  //     message = "Something went wrong${e.toString()}";
  //   }
  //   if (message != "") {
  //     navigator!.hideLoading();
  //     navigator!.showMessage(message);
  //   }
  // }



}