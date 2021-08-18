import UIKit

final class CurrencyButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel?.textAlignment = .center
        setTitleColor(.lightGray, for: .normal)
        layer.borderWidth = 1
        layer.borderColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
        backgroundColor = .white
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupConstraints() {
        titleLabel?.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        titleLabel?.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        titleLabel?.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        titleLabel?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
    }
}
