
import 'package:birthday/domain/test_state.dart';
import 'package:bloc/bloc.dart';

import '../data/repository/repository.dart';

class CatsCubit extends Cubit<CatsState> {
  final CatsRepository catsRepository;
  CatsCubit(this.catsRepository) : super(const CatsInitial()) {
    getCats();
  }

  Future<void> getCats() async {
    try {
      emit(const CatsLoading());
      await Future.delayed(const Duration(seconds: 3));
      final response = await catsRepository.getCatsFromApi();
      emit(CatsCompledet(response));
    } catch (e) {
      emit(CatsError(e.toString()));
    }
  }
}