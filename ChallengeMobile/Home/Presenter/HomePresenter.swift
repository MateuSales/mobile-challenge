final class HomePresenter {
    static func viewModel(initials: String?,
                          valueInDollar: String?,
                          convertedValue: String?) -> HomeViewModel {

        return HomeViewModel(firstButtonTitle: "USD",
                             secondButtonTitle: initials,
                             valueInDolar: valueInDollar,
                             description: description(initials, valueInDollar),
                             value: convertedValue,
                             buttonTitle: "Calcular")
    }

    private static func description(_ initials: String?,
                                    _ valueInDollar: String?) -> String? {
        guard let initials = initials,
              let valueInDollar = valueInDollar else {
            return nil
        }

        return "U$ \(valueInDollar) em \(initials) é:"
    }
}
