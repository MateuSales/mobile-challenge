final class ListPresenter {
    static func viewModel(from model: ListModel, with text: String? = nil) -> ListViewModel {
        return ListViewModel(currencies: makeCurrencies(from: model, with: text))
    }

    static private func makeCurrencies(from model: ListModel, with text: String?) -> [ListViewModel.Currency] {
        var currencies = model.currencies.map { ListViewModel.Currency(initials: $0.initials,
                                                                       description: $0.description) }
        if let text = text?.lowercased() {
            currencies = currencies.filter { $0.description.lowercased().hasPrefix(text) || $0.initials.lowercased().hasPrefix(text) }
        }
        return currencies
    }
}
