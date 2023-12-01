import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  BlocBloc() : super(BlocInitial()) {
    on<StartFirstPageAnimation>((event, emit) => emit(AnimateFirstPage()));
    on<StartSecondPageAnimation>((event, emit) => emit(AnimateSecondPage(200)));
    on<StartThirdPageAnimation>((event, emit) => emit(AnimateThirdPage()));
  }
}
