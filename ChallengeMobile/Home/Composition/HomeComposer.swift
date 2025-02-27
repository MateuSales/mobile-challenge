import UIKit

protocol HomeContract: AnyObject {
    func didTapReply(_ viewController: UIViewController, delegate: ListContract)
}

final class HomeComposer {
    static func start(delegate: HomeContract) -> UIViewController {
        let consumer = Consumer()
        let worker = HomeWorker(service: consumer)
        let adapter = HomeAdapter(worker: worker)
        let homeController = HomeViewController(delegate: adapter, title: "Home")
        adapter.viewController = homeController
        adapter.delegate = delegate
        return homeController
    }
}
