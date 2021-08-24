final class Validator {
    static func isValid(initials: String, valueInDollar: String) -> Bool {
        guard !valueInDollar.isEmpty, !initials.isEmpty else { return false }
        return true
    }
}
