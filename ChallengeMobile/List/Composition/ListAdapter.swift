import Foundation

final class ListAdapter {
    weak var viewController: ListViewController?
    private let worker: ListWorkerProtocol
    private var model: ListModel?
    weak var delegate: ListContract?

    init(worker: ListWorkerProtocol) {
        self.worker = worker
    }

    private func fetchList() {
        viewController?.showLoading()
        worker.getList { [weak self] model in
            if let model = model {
                self?.model = model
                self?.presentDataSource(model: model)
            } else {
                self?.viewController?.display(.requestError)
            }
        }
    }

    private func presentDataSource(model: ListModel?, text: String? = nil) {
        if let model = model {
            let viewModel = ListPresenter.viewModel(from: model, with: text)
            if viewModel.currencies.count > 0 {
                let dataSource = ListDataSource(viewModel: viewModel, delegate: self)
                viewController?.display(dataSource)
            } else {
                viewController?.display(.emptySearch)
            }
        }

    }
}

extension ListAdapter: ListViewControllerDelegate {
    func viewDidAppear() {
        fetchList()
    }

    func searchBarTextDidBeginEditing(_ text: String) {
        presentDataSource(model: model, text: text)
    }

    func cancelButtonPressed() {
        presentDataSource(model: model)
    }
}

extension ListAdapter: ListDataSourceDelegate {
    func didTapOption(initials: String) {
        viewController?.dismiss(animated: true, completion: nil)
        delegate?.didTapOption(initials: initials)
    }
}
