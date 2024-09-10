part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.status,
    required this.croutonMessage,
    required this.breeds,
  });

  factory HomeState.initialState() => const HomeState(
    status: HomeStatus.initial,
    croutonMessage: '',
    breeds: [],
  );

  final HomeStatus status;
  final String croutonMessage;
  final List<Breed> breeds;

  HomeState copyWith({
    HomeStatus? status,
    String? croutonMessage,
    List<Breed>? breeds,
  }) =>
      HomeState(
        status: status ?? this.status,
        croutonMessage: croutonMessage ?? this.croutonMessage,
        breeds: breeds ?? this.breeds,
      );

  @override
  List<Object?> get props => [
    status,
    croutonMessage,
    breeds,
  ];

  @override
  String toString() => '''
  HomeStatus: ${status.name}
  --------------------------------------------------------------------------------------------------------
  croutonMessage: $croutonMessage,
  breeds: $breeds,
  ''';
}
