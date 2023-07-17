part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<AdviceModel> adviceList;
  final bool isAdviceLoading;

  const HomeLoaded({
    required this.adviceList,
    required this.isAdviceLoading,
  });

  @override
  List<Object> get props => [adviceList, isAdviceLoading];
}

class HomeLoadedFailed extends HomeState {}
