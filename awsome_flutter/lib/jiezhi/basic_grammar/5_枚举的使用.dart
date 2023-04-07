main(List<String> args) {
  final d = Direction.east;
  final d1 = Direction.values[0];
  print(d1);
  switch (d1) {
    case Direction.east:
      print("east");
      break;
    default:
  }
}

// 枚举最大的好处 类型安全 定义了固定的值
enum Direction { north, south, west, east }
