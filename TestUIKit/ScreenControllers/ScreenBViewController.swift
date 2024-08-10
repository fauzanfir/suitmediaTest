import UIKit

class ScreenBViewController: UIViewController {
    private let headerView = UIView()
    private let welcomeLabel = UILabel()
    private let nameLabel = UILabel()
    let selectedUserLabel = UILabel()
    private let chooseUserButton = UIButton()
    
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        configureViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        headerView.backgroundColor = .gray.withAlphaComponent(0.2)
        
        navigationItem.title = "Second Screen"
        
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .purple
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        welcomeLabel.text = "Welcome"
        welcomeLabel.font = .systemFont(ofSize: 14, weight: .medium)
        welcomeLabel.textColor = .gray.withAlphaComponent(1.2)
        
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        
        selectedUserLabel.font = .systemFont(ofSize: 22, weight: .bold)
        selectedUserLabel.text = "Selected User Name"
        
        chooseUserButton.setTitle("Choose a User", for: .normal)
        chooseUserButton.setTitleColor(.white, for: .normal)
        chooseUserButton.backgroundColor = .orange
        chooseUserButton.layer.cornerRadius = 8
        chooseUserButton.addTarget(self, action: #selector(chooseUserTapped), for: .touchUpInside)
        
        view.addSubview(headerView)
        view.addSubview(welcomeLabel)
        view.addSubview(nameLabel)
        view.addSubview(selectedUserLabel)
        view.addSubview(chooseUserButton)
    }
    
    private func setupConstraints() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        selectedUserLabel.translatesAutoresizingMaskIntoConstraints = false
        chooseUserButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 0.5),
            
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 2),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),

            selectedUserLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectedUserLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            chooseUserButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            chooseUserButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            chooseUserButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            chooseUserButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func configureViews() {
        nameLabel.text = userName
    }
    
    @objc private func chooseUserTapped() {
        let screenC = ScreenCViewController()
        navigationController?.pushViewController(screenC, animated: true)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
