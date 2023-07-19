
import 'package:f_project/models/Shop_App/login_model/dataModel.dart';

abstract class ShopAppStates{

}

class ShopAppInitialStates extends ShopAppStates{

}
class ShopAppChangeBottomNavBarState extends ShopAppStates{


}

class ShopGetHomeDataLoadingState extends ShopAppStates{

}

class ShopGetHomeDataSuccessState extends ShopAppStates{

}

class ShopGetHomeDataErrorState extends ShopAppStates{
final String error;
ShopGetHomeDataErrorState(this.error);
}

class ShopGetCategoriesDataLoadingState extends ShopAppStates{

}

class ShopGetCategoriesDataSuccessState extends ShopAppStates{

}

class ShopGetCategoriesDataErrorState extends ShopAppStates{
  final String error;
  ShopGetCategoriesDataErrorState(this.error);
}


class ShopGetProfileDataLoadingState extends ShopAppStates{

}

class ShopGetProfileDataSuccessState extends ShopAppStates{

}

class ShopGetProfileDataErrorState extends ShopAppStates{
  final String error;
  ShopGetProfileDataErrorState(this.error);
}

class ShopUpadateProfileDataLoadingState extends ShopAppStates{

}

class ShopUpadateProfileDataSuccessState extends ShopAppStates{

}

class ShopUpadateProfileDataErrorState extends ShopAppStates{
  final String error;
  ShopUpadateProfileDataErrorState(this.error);
}

class changeAppModeState extends ShopAppStates{

}


