abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChanegeSelectFoosCatState extends AppStates {}

class AppChangeBottomNavState extends AppStates {}

class AppGetUsersSuccessState extends AppStates {}

class AppGetUsersLodaingState extends AppStates {}

class AppGetUsersErrorState extends AppStates {
  final String error;
  AppGetUsersErrorState(this.error);
}

class AppGetCarsListDataSuccessState extends AppStates {}

class AppGetCarsListDataLoadingState extends AppStates {}

class AppGetCarsListDataErrorState extends AppStates {
  final String error;
  AppGetCarsListDataErrorState(this.error);
}
