import '../../../base.dart';
import '../../../models/User.dart';

abstract class LoginNavigator implements BaseNavigator{

void goToHome(User myUser);
}