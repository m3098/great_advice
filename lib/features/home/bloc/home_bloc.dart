import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:great_advice/repositories/great_advice_repository.dart';
import 'package:great_advice/repositories/models/advice_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final List<AdviceModel> adviceList = [];
  HomeBloc() : super(HomeInitial()) {
    on<AddAdviceInList>((event, emit) async {
      emit(HomeLoading());

      try {
        adviceList.add(await GreatAdviceRepository().getRandomAdvice());
        emit(HomeLoaded(adviceList: adviceList));
      } catch (e) {
        emit(HomeLoadedFailed());
      }
    });
  }
}
