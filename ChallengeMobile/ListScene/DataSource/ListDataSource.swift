import UIKit

protocol ListDataSourceDelegate: AnyObject {
    func didTapOption(initials: String)
}

final class ListDataSource: NSObject{
    private let viewModel: ListViewModel
    private var delegate: ListDataSourceDelegate

    init(viewModel: ListViewModel, delegate: ListDataSourceDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
    }
}

extension ListDataSource: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.currencies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return currencyCell(tableView, at: indexPath)
    }

    private func currencyCell(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let currency = viewModel.currencies[indexPath.row]
        let cell = ListCurrencyCell()
        cell.titleLabel.text = currency.initials
        cell.descriptionLabel.text = currency.description
        return cell
    }

}

extension ListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let initials = viewModel.currencies[indexPath.row].initials
        delegate.didTapOption(initials: initials)
    }
}
