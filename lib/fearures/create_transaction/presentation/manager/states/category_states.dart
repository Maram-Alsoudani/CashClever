abstract class CategoryState{}

class CategoryInitialState extends CategoryState{}


class CategorySelectedState extends CategoryState{
  String selectedCategory;
  CategorySelectedState({required this.selectedCategory});
}

