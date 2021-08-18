import UIKit

protocol ListContract: AnyObject {
    func didTapOption(initials: String)
}

final class ListComposer {
    private init() {}

    public static func start(delegate: ListContract) -> UIViewController {
        let consumer = Consumer()
        let worker = ListWorker(service: consumer)
        let adapter = ListAdapter(worker: worker)
        let viewController = ListViewController(delegate: adapter, title: "Lista de Moedas")
        adapter.viewController = viewController
        adapter.delegate = delegate
        return viewController
    }
}
