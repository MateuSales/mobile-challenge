import UIKit

extension UITextField {
    func setupToolBar() {
        let toolbar = UIToolbar()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                        target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Feito", style: .done,
                                         target: self, action: #selector(doneButtonTapped))

        toolbar.setItems([flexSpace, doneButton], animated: true)
        toolbar.sizeToFit()

        inputAccessoryView = toolbar
    }

    @objc func doneButtonTapped() {
        endEditing(true)
    }
}
