import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'animation_bloc_event.dart';
part 'animation_bloc_state.dart';

class AnimationBloc extends Bloc<BlocEvent, BlocState> {
  AnimationBloc() : super(BlocInitial()) {
    on<StartFirstPageAnimation>((event, emit) => emit(AnimateFirstPage()));
    on<StartSecondPageAnimation>((event, emit) => emit(AnimateSecondPage(200)));
    on<StartThirdPageAnimation>((event, emit) => emit(AnimateThirdPage()));
  }
}
