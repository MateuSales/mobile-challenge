import UIKit

protocol HomeDataSourceDelegate: AnyObject {
    func didTapSecondButton()
    func didTapCalculateButton(initials: String, valueInDollar: String)
}

final class HomeDataSource: NSObject {

    private var delegate: HomeDataSourceDelegate
    private let viewModel: HomeViewModel

    init(delegate: HomeDataSourceDelegate, viewModel: HomeViewModel) {
        self.delegate = delegate
        self.viewModel = viewModel
    }
}

extension HomeDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeCell()
        cell.firstButton.setTitle(viewModel.firstButtonTitle, for: .normal)
        cell.secondButton.setTitle(viewModel.secondButtonTitle, for: .normal)
        cell.valueTextField.text = viewModel.valueInDolar
        cell.descriptionLabel.text = viewModel.description
        cell.valueLabel.text = viewModel.value
        cell.calculateButton.setTitle(viewModel.buttonTitle, for: .normal)
        cell.didTapSelectOption = { [weak self] in
            self?.delegate.didTapSecondButton()
        }
        cell.didTapCalculate = { [weak self] initials, valueInDollar in
            self?.delegate.didTapCalculateButton(initials: initials, valueInDollar: valueInDollar)
        }
        return cell
    }
}

extension HomeDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}
