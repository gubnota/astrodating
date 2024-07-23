import XCTest
@testable import YourProjectName

class EntryInteractorTests: XCTestCase {
    var interactor: EntryInteractor!
    var presenter: MockEntryPresenter!

    override func setUp() {
        super.setUp()
        interactor = EntryInteractor()
        presenter = MockEntryPresenter()
        interactor.presenter = presenter
    }

    override func tearDown() {
        interactor = nil
        presenter = nil
        super.tearDown()
    }

    func testLoadInitialData() {
        interactor.loadInitialData()
        XCTAssertTrue(presenter.didLoadInitialDataCalled)
    }
}

class MockEntryPresenter: EntryPresenterProtocol {
    var currentRoute: String = ""
    var didLoadInitialDataCalled = false

    func onViewAppear() {}
    func didLoadInitialData() {
        didLoadInitialDataCalled = true
    }
}