struct RemoteHomeModel: Decodable {
    let success: Bool
    let source: String
    let quotes: [String: Double]
}
