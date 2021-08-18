import UIKit

extension UITableView {

    public func register<T: UITableViewCell>(_ : T.Type) where T: Reusable {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }

    public func dequeueReusable<T: UITableViewCell>(_: T.Type,
                                                    indexPath: IndexPath) -> T where T: Reusable {

        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            register(T.self)
            return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
        }
        return cell
    }
}

public protocol Reusable {}

extension Reusable {
    static public var reuseIdentifier: String {
        return String(describing: self)
    }
}
