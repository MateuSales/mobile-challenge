final class Converter {
    static func calculate(model: HomeModel?,
                          initials: String,
                          valueInDollarString: String) -> String? {

        guard let quote = model?.quotes.first(where: { $0.initial == initials }),
              let value = Double(valueInDollarString) else {
            return nil
        }

        return String(format: "%.2f", (quote.value * value))
    }
}
