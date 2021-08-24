final class ListMapper {
    static func map(from result: Result<RemoteListModel, CustomError>) -> ListModel? {
        switch result {
        case .failure(let error):
            print(error.errorDescription)
            return nil
        case .success(let remoteModel):
            return make(from: remoteModel)
        }
    }

    static private func make(from model: RemoteListModel) -> ListModel {
        let currencies = model.currencies.map { ListModel.Currency(initials: $0, description: $1) }
        return ListModel(currencies: currencies)
    }
}
