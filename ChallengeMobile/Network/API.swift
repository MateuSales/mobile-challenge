import Foundation

enum API {
    case list
    case live

    var baseUrl: String {
        return "https://btg-mobile-challenge.herokuapp.com"
    }

    var path: String {
        switch self {
        case .list:
            return "/list"
        case .live:
            return "/live"
        }
    }

    func createUrl() -> URL? {
        guard let url = URL(string: "\(baseUrl)\(path)") else { return nil }
        return url
    }

}
