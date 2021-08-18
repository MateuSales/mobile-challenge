import UIKit

final class Coordinator {

    func start() -> UIViewController {
        let homeController = HomeComposer.start(delegate: self)
        let navigationController = UINavigationController(rootViewController: homeController)
        return navigationController
    }
}

extension Coordinator: HomeContract {
    func didTapReply(_ viewController: UIViewController, delegate: ListContract) {
        let listController = ListComposer.start(delegate: delegate)
        let navigationController = UINavigationController(rootViewController: listController)
        viewController.present(navigationController, animated: true, completion: nil)
    }
}
