part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.status,
    required this.croutonMessage,
  });

  factory HomeState.initialState() => const HomeState(
    status: HomeStatus.initial,
    croutonMessage: '',
  );

  final HomeStatus status;
  final String croutonMessage;

  HomeState copyWith({
    HomeStatus? status,
    int? currentPage,
    String? croutonMessage,
  }) =>
      HomeState(
        status: status ?? this.status,
        croutonMessage: croutonMessage ?? this.croutonMessage,
      );

  @override
  List<Object?> get props => [
    status,
    croutonMessage,
  ];

  @override
  String toString() => '''
  HomeStatus: ${status.name}
  --------------------------------------------------------------------------------------------------------
  croutonMessage: $croutonMessage,
  ''';
}
