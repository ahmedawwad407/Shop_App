
import 'package:f_project/models/Shop_App/login_model/dataModel.dart';

abstract class ShopRegisterStates{

}

class ShopRegisterInitialStates extends ShopRegisterStates{

}

class ShopRegisterLoadingState extends ShopRegisterStates{

}

class ShopRegisterSuccessState extends ShopRegisterStates{
    final ShopLoginModel loginModel;

    ShopRegisterSuccessState(this.loginModel);
}

class ShopRegisterErrorState extends ShopRegisterStates{
  final String error;
  ShopRegisterErrorState(this.error);
}
class changeShowPasswordIconRegisterState extends ShopRegisterStates{

}

