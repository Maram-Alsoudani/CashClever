import 'package:CashClever/fearures/create_transaction/presentation/manager/states/category_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super( CategoryInitialState());

  final List<String> categories = [
    'Food', 'Social', 'Traffic', 'Shopping', 'Grocery',
    'Education', 'Bills', 'Rentals', 'Medical',
    'Investments', 'Gift', 'Other'
  ];
  int? selectedIndex;
  String? selectedCategory;

  void selectCategory(int index) {

    selectedIndex= index;
    selectedCategory= categories[index];

    emit(CategorySelectedState(selectedCategory: categories[index]));
      selectedIndex= null;

  }
  void reset(){
    emit(CategoryInitialState());
  }
}