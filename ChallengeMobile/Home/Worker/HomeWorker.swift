final class HomeWorker {

    private let service: Service

    init(service: Service) {
        self.service = service
    }

    func getLive(callback: @escaping (HomeModel?) -> Void) {
        service.get(api: .live) { (response) in
            callback(HomeMapper.map(from: response))
        }
    }
}

