import Foundation

protocol Service {
    func get<T: Decodable>(api: API, callback: @escaping (Result<T, CustomError>) -> Void)
}

final class ListConsumer: Service {

    func get<T: Decodable>(api: API, callback: @escaping (Result<T, CustomError>) -> Void) {
        guard let url = api.createUrl() else {
            callback(.failure(.urlIncorrect))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                if error != nil {
                    callback(.failure(.requestFailure))
                }

                if let data = data {
                    guard let result = try? JSONDecoder().decode(T.self, from: data) else {
                        callback(.failure(.requestFailure))
                        return
                    }
                    callback(.success(result))
                } else {
                    callback(.failure(.unknown))
                }
            }
        }.resume()
    }
}
