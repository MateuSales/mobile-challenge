import UIKit

protocol ListViewControllerDelegate: AnyObject {
    func viewDidAppear()
    func searchBarTextDidBeginEditing(_ text: String)
    func cancelButtonPressed()
}

final class ListViewController: StateViewController {

    private var delegate: ListViewControllerDelegate?
    private let searchController = UISearchController()

    init(delegate: ListViewControllerDelegate, title: String) {
        super.init(style: .grouped)
        self.delegate = delegate
        self.title = title
        setupSearchController()
        registerCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delegate?.viewDidAppear()
    }

    private func setupSearchController() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Pesquisar moedas"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    private func registerCell() {
        tableView.register(ListCurrencyCell.self)
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.searchBarTextDidBeginEditing(searchText)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        delegate?.cancelButtonPressed()
    }
}
