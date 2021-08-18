final class ListWorker {

    private let service: Service

    init(service: Service = ListConsumer()) {
        self.service = service
    }

    func getList(callback: @escaping (ListModel?) -> Void) {
        service.get(api: .list) { (response) in
            callback(ListMapper.map(from: response))
        }
    }
}
