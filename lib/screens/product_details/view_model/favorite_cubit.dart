import 'package:flutter_bloc/flutter_bloc.dart';
import 'favorite_state.dart';
class FavoriteCubit extends Cubit<ProductDetailsState> {
  FavoriteCubit() : super(ProductInitialState());
  bool isFavorite = false;
  void toggleFavorite(String productName) {
    isFavorite = !isFavorite;
    emit(ChangeIconState(email: 'jfsnfjzjdbf'));
  }


}