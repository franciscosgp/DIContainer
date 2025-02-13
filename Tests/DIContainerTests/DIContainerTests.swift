import Testing
@testable import DIContainer

class MyExampleClass {
    var value: Int

    init(value: Int = 0) {
        self.value = value
    }
}

@Test func registerAndResolveDependency() {

    DIContainer.shared.register(MyExampleClass(value: 2), for: MyExampleClass.self)

    @Injected var exampleClass: MyExampleClass
    #expect(exampleClass.value == 2)

    DIContainer.shared.clear()

    DIContainer.shared.register(MyExampleClass(), for: MyExampleClass.self)

    @Injected var exampleClassNew: MyExampleClass
    #expect(exampleClassNew.value == .zero)

}
