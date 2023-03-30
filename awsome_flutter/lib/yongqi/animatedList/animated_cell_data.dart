class AnimatedCellListData {
  static final List shoppingList = [
    ShoppingItem("牛奶", "images/milk.png"),
    ShoppingItem("香蕉", "images/banana.png"),
    ShoppingItem("葡萄", "images/grape.png"),
    ShoppingItem("橘子", "images/orange.png"),
    ShoppingItem("苹果", "images/apple.png"),
  ];
}

class ShoppingItem {
  String? title;
  String? urlImage;
  ShoppingItem(this.title, this.urlImage);
}
