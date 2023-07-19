abstract class ShopSearchStates{

}

class ShopSearchInitialStates extends ShopSearchStates{

}
class ShopGetDataSearchLoadingState extends ShopSearchStates{

}

class ShopGetDataSearchSuccessState extends ShopSearchStates{

}

class ShopGetDataSearchErrorState extends ShopSearchStates{
  final String error;
  ShopGetDataSearchErrorState(this.error);
}



