import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);
  void selectTab(int index) => emit(index);
}
