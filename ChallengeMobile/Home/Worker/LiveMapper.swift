final class HomeMapper {
    static func map(from result: Result<RemoteHomeModel, CustomError>) -> HomeModel? {
        switch result {
        case .failure(let error):
            print(error.errorDescription)
            return nil
        case .success(let remoteModel):
            return HomeModel(quotes: makeQuotes(from: remoteModel))
        }
    }

    private static func makeQuotes(from model: RemoteHomeModel) -> [HomeModel.Quote] {
        return model.quotes.map { HomeModel.Quote(initial: String($0.key.suffix(3)), value: $0.value) }
    }
}
