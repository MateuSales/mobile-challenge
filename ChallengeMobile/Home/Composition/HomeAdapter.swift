final class HomeAdapter {
    weak var viewController: HomeViewController?
    weak var delegate: HomeContract?
    private var model: HomeModel?
    private let worker: HomeWorker

    init(worker: HomeWorker) {
        self.worker = worker
    }

    private func presentDataSource(_ initials: String? = nil,
                                   _ valueInDollar: String? = nil,
                                   _ convertedValue: String? = nil) {
        let viewModel = HomePresenter.viewModel(initials: initials,
                                                valueInDollar: valueInDollar,
                                                convertedValue: convertedValue)
        let dataSource = HomeDataSource(delegate: self, viewModel: viewModel)
        viewController?.display(dataSource)
    }

    private func fetchQuote() {
        viewController?.showLoading()
        worker.getLive { [weak self] model in
            if let model = model {
                self?.model = model
                self?.presentDataSource()
                self?.viewController?.showAlert(.success)
            } else {
                self?.viewController?.showAlert(.error)
            }
        }
    }
}

extension HomeAdapter: HomeViewControllerDelegate {
    func didTapRefreshButton() {
        fetchQuote()
    }

    func viewDidAppear() {
        fetchQuote()
    }
}

extension HomeAdapter: ListContract {
    func didTapOption(initials: String) {
        presentDataSource(initials)
    }
}

extension HomeAdapter: HomeDataSourceDelegate {
    func didTapSecondButton() {
        guard let viewController = viewController else { return }
        delegate?.didTapReply(viewController, delegate: self)
    }

    func didTapCalculateButton(initials: String, valueInDollar: String) {
        if Validator.isValid(initials: initials, valueInDollar: valueInDollar) {
            guard let convertedValue = Converter.calculate(model: model, initials: initials, valueInDollarString: valueInDollar) else { return }
            presentDataSource(initials, valueInDollar, convertedValue)
        } else {
            viewController?.showAlert(.errorInCalculate)
        }

    }
}
