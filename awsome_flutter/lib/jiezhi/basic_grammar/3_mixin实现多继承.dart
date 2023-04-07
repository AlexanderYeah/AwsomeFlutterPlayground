main(List<String> args) {
  Test();
}

class BaseMixin {
  void init() {
    print("BaseMixin init");
  }

  BaseMixin() {
    init();
  }
}

mixin TestMixin1 on BaseMixin {
  @override
  void init() {
    // TODO: implement init
    print("TestMixin1 init start");
    super.init();
    print("TestMixin1 init end");
  }
}

mixin TestMixin2 on BaseMixin {
  @override
  void init() {
    // TODO: implement init
    print("TestMixin2 init start");
    super.init();
    print("TestMixin2 init end");
  }
}

class Test extends BaseMixin with TestMixin1, TestMixin2 {
  @override
  void init() {
    /**
     *  Test init start
        TestMixin2 init start
        TestMixin1 init start
        BaseMixin init
        TestMixin1 init end
        TestMixin2 init end
        Test init end
     * */

    // TODO: implement init
    print("Test init start");
    super.init();
    print("Test init end");
  }
}
