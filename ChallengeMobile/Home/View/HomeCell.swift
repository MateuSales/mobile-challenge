import UIKit

final class HomeCell: UITableViewCell, Reusable {
    var didTapSelectOption: (() -> Void)?
    var didTapCalculate: ((_ initials: String, _ valueInDollar: String) -> Void)?

    let firstButton: CurrencyButton = {
        let button = CurrencyButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let secondButton: CurrencyButton = {
        let button = CurrencyButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let valueTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite o valor aqui"
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.font = UIFont.boldSystemFont(ofSize: 20)
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.textColor = .lightGray
        return textField
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()

    let valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.numberOfLines = 0
        return label
    }()

    let calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(firstButton)
        contentView.addSubview(secondButton)
        contentView.addSubview(valueTextField)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(valueLabel)
        contentView.addSubview(calculateButton)
        secondButton.addTarget(self, action: #selector(didTapSecondButton), for: .touchUpInside)
        setupConstraints()
        calculateButton.addTarget(self, action: #selector(didTapCalculateButton), for: .touchUpInside)
        valueTextField.setupToolBar()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupConstraints() {
        firstButton.topAnchor.constraint(equalTo: topAnchor, constant: 32).isActive = true
        firstButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        firstButton.widthAnchor.constraint(equalToConstant: 70).isActive = true

        secondButton.topAnchor.constraint(equalTo: topAnchor, constant: 32).isActive = true
        secondButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
        secondButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        secondButton.widthAnchor.constraint(equalToConstant: 70).isActive = true

        valueTextField.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 32).isActive = true
        valueTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        valueTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
        valueTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        descriptionLabel.topAnchor.constraint(equalTo: valueTextField.bottomAnchor, constant: 32).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true

        valueLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24).isActive = true
        valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true

        calculateButton.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 24).isActive = true
        calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
        calculateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

    }

    @objc private func didTapSecondButton() {
        didTapSelectOption?()
    }

    @objc private func didTapCalculateButton() {
        didTapCalculate?(secondButton.title(for: .normal) ?? "",
                         valueTextField.text ?? "")
    }
}
