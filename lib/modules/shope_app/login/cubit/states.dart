
import 'package:f_project/models/Shop_App/login_model/dataModel.dart';

abstract class ShopLoginStates{

}

class ShopLoginInitialStates extends ShopLoginStates{

}

class ShopLoginLoadingState extends ShopLoginStates{

}

class ShopLoginSuccessState extends ShopLoginStates{
    final ShopLoginModel loginModel;

    ShopLoginSuccessState(this.loginModel);
}

class ShopLoginErrorState extends ShopLoginStates{
  final String error;
  ShopLoginErrorState(this.error);
}
class changeShowPasswordIconState extends ShopLoginStates{

}

