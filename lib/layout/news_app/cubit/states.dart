
abstract class NewsAppStates{

}

class AppInitialStates extends NewsAppStates{

}
class AppChangeBottomNavBarState extends NewsAppStates{


}
class AppChangeBottomSheetState extends NewsAppStates{

}
class NewsGetBusinessLoadingState extends NewsAppStates{

}

class NewsGetBusinessSuccessState extends NewsAppStates{

}

class NewsGetBusinessErrorState extends NewsAppStates{
final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportLoadingState extends NewsAppStates{

}

class NewsGetSportSuccessState extends NewsAppStates{

}

class NewsGetSportErrorState extends NewsAppStates{
  final String error;
  NewsGetSportErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsAppStates{

}

class NewsGetScienceSuccessState extends NewsAppStates{

}

class NewsGetScienceErrorState extends NewsAppStates{
  final String error;
  NewsGetScienceErrorState(this.error);
}
class NewsGetDataSearchLoadingState extends NewsAppStates{

}

class NewsGetDataSearchSuccessState extends NewsAppStates{

}

class NewsGetDataSearchErrorState extends NewsAppStates{
  final String error;
  NewsGetDataSearchErrorState(this.error);
}

class changeAppModeState extends NewsAppStates{

}


