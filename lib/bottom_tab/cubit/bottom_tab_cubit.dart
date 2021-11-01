import 'package:bloc/bloc.dart';

enum Tab { home, blog, links, trips }

class BottomTabCubit extends Cubit<Tab> {
  BottomTabCubit() : super(Tab.home);

  void selectTab(int index) => emit(Tab.values[index]);
}
