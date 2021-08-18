import UIKit

typealias DataSourceAndDelegate = UITableViewDataSource&UITableViewDelegate

enum ErrorHandling {
    case requestError
    case emptySearch
}

enum State {
    case unknown, loading
    case loaded(DataSourceAndDelegate)
    case error(ErrorHandling)
}

class StateViewController: UITableViewController {
    private let activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.style = .large
        return activity
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .lightGray
        return label
    }()

    private var state: State = .unknown {
        didSet {
            updateState()
        }
    }

    override init(style: UITableView.Style) {
        super.init(style: style)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func display(_ dataSource: DataSourceAndDelegate) {
        state = .loaded(dataSource)
    }

    func display(_ error: ErrorHandling) {
        state = .error(error)
    }

    func showLoading() {
        state = .loading
    }

    func showAlert(_ type: AlertType) {
        switch type {
        case .error:
            showAlert(title: "Não deu certo :(",
                      message: "Tente mais tarde por favor")
        case .success:
            showAlert(title: "Tudo Certo :)",
                      message: "Cotações atualizadas com sucesso")
        case .invalidInput:
            showAlert(title: "Entradas inválidas :(",
                      message: "Certifique-se de selecionar uma moeda e digitar um valor antes de realizar o cálculo")
        case .errorInCalculate:
            showAlert(title: "Desculpe :(",
                      message: "No momento não conseguimos realizar o cálculo, tente com outra moeda :D")
        }
    }

    private func updateState() {
        cleanTableView()
        switch state {
        case .loading:
            activity.startAnimating()
            tableView.backgroundView = activity
        case .error(let error):
            handleError(error)
        case .loaded(let dataSource):
            tableView.dataSource = dataSource
            tableView.delegate = dataSource
        default: break
        }
        tableView.reloadData()
    }

    private func handleError(_ error: ErrorHandling) {
        switch error {
        case .requestError:
            label.text = "Erro na requisição :("
            tableView.backgroundView = label
        case .emptySearch:
            label.text = "Não encontramos nada :("
            tableView.backgroundView = label
        }
    }

    private func cleanTableView() {
        tableView.backgroundView = nil
    }

    private func setupViews() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.tableHeaderView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: CGFloat.leastNormalMagnitude)))
    }
}
