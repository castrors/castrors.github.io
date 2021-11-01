import 'package:bloc/bloc.dart';

enum LocaleOptions { en, pt }

class AppCubit extends Cubit<LocaleOptions> {
  AppCubit() : super(LocaleOptions.pt);

  void selectLocale(LocaleOptions locale) => emit(locale);
}
