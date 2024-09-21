part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.initial({
    String? name,
    @Default(false) bool status,
  }) = _Initial;

  const HomePageState._(); // Add this private constructor

  // Custom method that checks if `name` is not null
  bool isTrue() {
    return name != null && name!.isNotEmpty;
  }
}
