import 'package:gss/domain/models/tower.dart';

abstract class AbstractionHomeState{}

class HomeInitialState extends AbstractionHomeState{}
class HomeLoadingState extends AbstractionHomeState{}
class HomeGetDataSuccessState extends AbstractionHomeState{
  List<TowerModel>towers;
  HomeGetDataSuccessState({required this.towers});
}
class HomeGetDataErrorsState extends AbstractionHomeState{
  String error;

  HomeGetDataErrorsState({required this.error});
}
class HomeChangeNavState extends AbstractionHomeState{
  int homeChangeNavIdx;

  HomeChangeNavState({required this.homeChangeNavIdx});
}
class HomeItemListClickState extends AbstractionHomeState{}
class HomeLogoListClickState extends AbstractionHomeState{}
class HomeFavoritesClickState extends AbstractionHomeState{}
class HomeOpenWhatsAppClickState extends AbstractionHomeState{
  String homeWhatsAppNumber;

  HomeOpenWhatsAppClickState({required this.homeWhatsAppNumber});
}
class HomeCallClickState extends AbstractionHomeState{
}
class HomeEmailClickState extends AbstractionHomeState{
}
class HomeSearchChangeState extends AbstractionHomeState{
  dynamic homeResult;

  HomeSearchChangeState({required this.homeResult});
}
class HomeSavedClickedState extends AbstractionHomeState{}
class HomeFloatingMapClickState extends AbstractionHomeState{}
class HomeFloatingSortClickState extends AbstractionHomeState{}