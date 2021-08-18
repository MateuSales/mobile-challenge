import UIKit

enum AlertType {
    case success
    case error
    case invalidInput
    case errorInCalculate
}

protocol HomeViewControllerDelegate: AnyObject {
    func didTapRefreshButton()
    func viewDidAppear()
}

final class HomeViewController: StateViewController {

    private var delegate: HomeViewControllerDelegate?

    init(delegate: HomeViewControllerDelegate, title: String) {
        super.init(style: .grouped)
        self.delegate = delegate
        self.title = title
        setupNavigationButton()
        configureTableView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delegate?.viewDidAppear()
    }

    private func setupNavigationButton() {
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh,
                                                 target: self,
                                                 action: #selector(didTapRightButton))
        navigationItem.setRightBarButton(rightBarButtonItem, animated: false)
    }

    private func configureTableView() {
        tableView.bounces = false
    }

    @objc private func didTapRightButton() {
        delegate?.didTapRefreshButton()
    }
}
