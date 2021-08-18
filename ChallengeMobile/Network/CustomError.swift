import Foundation

enum CustomError: Error, LocalizedError {
    case urlIncorrect
    case requestFailure
    case decoderError
    case unknown

    var errorDescription: String {
        switch self {
        case .urlIncorrect:
            return "URL incorreta"
        case .requestFailure:
            return "Falha ao tentar realizar a requisição"
        case .decoderError:
            return "Objeto não decodificado"
        case .unknown:
            return "Erro desconhecido"
        }
    }
}
