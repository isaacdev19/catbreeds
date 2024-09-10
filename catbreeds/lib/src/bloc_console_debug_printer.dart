import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocConsoleDebugPrinter extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);

    if (kDebugMode && bloc is Cubit) {
      const lineSeparator =
          '--------------------------------------------------------------------------------------------------------';
      final changelog =
          '\n(*) State Change in ${bloc.runtimeType}\n$lineSeparator\n<before>: ${change.currentState}\n$lineSeparator\n<after>: ${change.nextState}';

      debugPrint(changelog);
    }
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);

    debugPrint(event.toString());
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc,
      Transition<dynamic, dynamic> transition,
      ) {
    super.onTransition(bloc, transition);

    debugPrint(transition.toString());
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    debugPrint(error.toString());
  }
}
