import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.dart';
part 'home_page_cubit.freezed.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageState.initial());

 void changeTitle(String? name){
  emit(state.copyWith(
    name: name,
  ));
 }

 bool getStatus(){
  return state.status;
 }

 void changeStatus(bool status){
  emit(state.copyWith(
    status: status,
  ));
 }


}
