import '../global.dart' as global;
import 'appbar/SearchButton.dart';

/*
** Dynamically set appbar->actions[optional], for BottomNavBarItems
** pages. Only default widget are allowed on all page...
*/
class MainAppBar {
  MainAppBar.update(int index){
    switch(index){
      case 0:
        global.optionalAppBarAction
            .add(SearchButton.show(function: (){}));
      break;

      case 1: ;
      break;

      case 2: ;
      break;

      case 3: ;
      break;

      case 4: ;
      break;

    }
  }
}