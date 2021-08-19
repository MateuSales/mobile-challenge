protocol ListWorkerProtocol: AnyObject {
    func getList(callback: @escaping (ListModel?) -> Void)
}

final class ListWorker: ListWorkerProtocol {

    private let service: Service

    init(service: Service) {
        self.service = service
    }

    func getList(callback: @escaping (ListModel?) -> Void) {
        service.get(api: .list) { (response) in
            callback(ListMapper.map(from: response))
        }
    }
}
