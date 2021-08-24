struct RemoteListModel: Decodable {
    let success: Bool
    let currencies: [String: String]
}
