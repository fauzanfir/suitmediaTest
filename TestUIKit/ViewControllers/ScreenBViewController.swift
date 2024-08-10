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
        let font = UIFont(name: "Poppins", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .semibold)
        view.backgroundColor = .white
        
        headerView.backgroundColor = .gray.withAlphaComponent(0.2)
        
        navigationItem.title = "Second Screen"
        
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = UIColor(rgb: 0x554bf0)
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
        chooseUserButton.backgroundColor = UIColor(rgb: 0x2B637B)
        chooseUserButton.layer.cornerRadius = 10
        chooseUserButton.addTarget(self, action: #selector(chooseUserTapped), for: .touchUpInside)
        
        var attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.white,
            .kern: 0.1,
        ]
        
        let attributedTitle = NSMutableAttributedString(string: "Choose a User", attributes: attributes)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.5
        paragraphStyle.alignment = .center
        attributes[.paragraphStyle] = paragraphStyle
        
        chooseUserButton.setAttributedTitle(attributedTitle, for: .normal)
        
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
