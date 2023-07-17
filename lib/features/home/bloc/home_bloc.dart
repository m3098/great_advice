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
      if (state is! HomeLoaded) {
        emit(HomeLoading());
      }

      try {
        if (adviceList.isNotEmpty) {
          emit(HomeLoaded(adviceList: adviceList, isAdviceLoading: true));
        }

        emit(HomeLoaded(
            adviceList: adviceList
              ..add(await GreatAdviceRepository().getRandomAdvice()),
            isAdviceLoading: false));
      } catch (e) {
        emit(HomeLoadedFailed());
      }
    });
  }
}
