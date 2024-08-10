import UIKit

class ScreenAViewController: UIViewController {
    private let backgroundCircleImageView = UIImageView()
    private let logoImageView = UIImageView()
    private let nameTextField = UITextField()
    private let sentenceTextField = UITextField()
    private let checkButton = UIButton()
    private let nextButton = UIButton()
    
    private var name: String = "John Doe"
    private var sentence: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        backgroundCircleImageView.backgroundColor = .gray.withAlphaComponent(0.2)
        backgroundCircleImageView.layer.cornerRadius = 55 // Larger circle radius
        backgroundCircleImageView.layer.masksToBounds = true
        backgroundCircleImageView.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.image = UIImage(systemName: "person.fill.badge.plus") // Example icon
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.tintColor = .black // Adjust the logo color if needed
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        nameTextField.borderStyle = .roundedRect
        nameTextField.placeholder = "Name"
        nameTextField.addTarget(self, action: #selector(nameTextFieldChanged(_:)), for: .editingChanged)
        
        sentenceTextField.borderStyle = .roundedRect
        sentenceTextField.placeholder = "Palindrome"
        sentenceTextField.addTarget(self, action: #selector(sentenceTextFieldChanged(_:)), for: .editingChanged)
        
        checkButton.setTitle("Check", for: .normal)
        checkButton.setTitleColor(.white, for: .normal)
        checkButton.backgroundColor = .blue
        checkButton.layer.cornerRadius = 8
        checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = .green
        nextButton.layer.cornerRadius = 8
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        view.addSubview(backgroundCircleImageView)
        view.addSubview(logoImageView)
        view.addSubview(nameTextField)
        view.addSubview(sentenceTextField)
        view.addSubview(checkButton)
        view.addSubview(nextButton)
    }
    
    private func setupConstraints() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        sentenceTextField.translatesAutoresizingMaskIntoConstraints = false
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundCircleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            backgroundCircleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundCircleImageView.widthAnchor.constraint(equalToConstant: 110), // Larger size
            backgroundCircleImageView.heightAnchor.constraint(equalToConstant: 110), // Larger size
            
            logoImageView.centerXAnchor.constraint(equalTo: backgroundCircleImageView.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: backgroundCircleImageView.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 30), // Smaller logo size
            logoImageView.heightAnchor.constraint(equalToConstant: 30), // Smaller logo size
            
            nameTextField.topAnchor.constraint(equalTo: backgroundCircleImageView.bottomAnchor, constant: 60),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            sentenceTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            sentenceTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            sentenceTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            sentenceTextField.heightAnchor.constraint(equalToConstant: 40),
            
            checkButton.topAnchor.constraint(equalTo: sentenceTextField.bottomAnchor, constant: 50),
            checkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            checkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            checkButton.heightAnchor.constraint(equalToConstant: 40),
            
            nextButton.topAnchor.constraint(equalTo: checkButton.bottomAnchor, constant: 20),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func nameTextFieldChanged(_ textField: UITextField) {
        name = textField.text ?? ""
    }
    
    @objc private func sentenceTextFieldChanged(_ textField: UITextField) {
        sentence = textField.text ?? ""
    }
    
    @objc private func checkButtonTapped() {
        let isPalindrome = checkPalindrome(sentence)
        let message = isPalindrome ? "The sentence is a palindrome." : "The sentence is not a palindrome."
        showAlert(message: message)
    }
    
    @objc private func nextButtonTapped() {
        let screenB = ScreenBViewController()
        screenB.userName = name
        navigationController?.pushViewController(screenB, animated: true)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func checkPalindrome(_ sentence: String) -> Bool {
        let cleanedSentence = sentence.replacingOccurrences(of: " ", with: "").lowercased()
        return cleanedSentence == String(cleanedSentence.reversed())
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Palindrome Check", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
