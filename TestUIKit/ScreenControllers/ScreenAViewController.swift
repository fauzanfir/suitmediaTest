import UIKit

class ScreenAViewController: UIViewController {
    private let backgroundCircleImageView = UIImageView()
    private let backgroundImageView = UIImageView()
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
        let font = UIFont(name: "Poppins", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .semibold)
        view.backgroundColor = .white
        
        backgroundImageView.image = UIImage(named: "Screen1BG")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        
        backgroundCircleImageView.backgroundColor = .white.withAlphaComponent(0.4)
        backgroundCircleImageView.layer.cornerRadius = 58 // Larger circle radius
        backgroundCircleImageView.layer.masksToBounds = true
        backgroundCircleImageView.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.image = UIImage(systemName: "person.fill.badge.plus") // Example icon
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.tintColor = .white // Adjust the logo color if needed
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        
        nameTextField.placeholder = "Name"
        nameTextField.backgroundColor = .white
        nameTextField.layer.cornerRadius = 10
        nameTextField.addTarget(self, action: #selector(nameTextFieldChanged(_:)), for: .editingChanged)
        nameTextField.leftView = paddingView
        nameTextField.leftViewMode = .always
        
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        
        sentenceTextField.placeholder = "Palindrome"
        sentenceTextField.backgroundColor = .white
        sentenceTextField.layer.cornerRadius = 10
        sentenceTextField.addTarget(self, action: #selector(sentenceTextFieldChanged(_:)), for: .editingChanged)
        sentenceTextField.leftView = paddingView2
        sentenceTextField.leftViewMode = .always
        
        
        checkButton.setTitle("CHECK", for: .normal)
        checkButton.setTitleColor(.white, for: .normal)
        checkButton.backgroundColor = UIColor(rgb: 0x2B637B)
        checkButton.layer.cornerRadius = 10
        checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        
        var attributes1: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.white,
            .kern: 0.1,
        ]
        
        let attributedTitle1 = NSMutableAttributedString(string: "CHECK", attributes: attributes1)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.5 
        paragraphStyle.alignment = .center
        attributes1[.paragraphStyle] = paragraphStyle
        
        checkButton.setAttributedTitle(attributedTitle1, for: .normal)
        
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = UIColor(rgb: 0x2B637B)
        nextButton.layer.cornerRadius = 10
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        var attributes2: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.white,
            .kern: 0.1,
        ]
        
        let attributedTitle2 = NSMutableAttributedString(string: "NEXT", attributes: attributes2)
        let paragraphStyle2 = NSMutableParagraphStyle()
        paragraphStyle2.lineHeightMultiple = 1.5
        paragraphStyle2.alignment = .center
        attributes2[.paragraphStyle] = paragraphStyle2
        
        nextButton.setAttributedTitle(attributedTitle2, for: .normal)
        
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
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            backgroundCircleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            backgroundCircleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundCircleImageView.widthAnchor.constraint(equalToConstant: 116), // Larger size
            backgroundCircleImageView.heightAnchor.constraint(equalToConstant: 116), // Larger size
            
            logoImageView.centerXAnchor.constraint(equalTo: backgroundCircleImageView.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: backgroundCircleImageView.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 30), // Smaller logo size
            logoImageView.heightAnchor.constraint(equalToConstant: 30), // Smaller logo size
            
            nameTextField.topAnchor.constraint(equalTo: backgroundCircleImageView.bottomAnchor, constant: 60),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            nameTextField.heightAnchor.constraint(equalToConstant: 41),
            
            sentenceTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            sentenceTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            sentenceTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            sentenceTextField.heightAnchor.constraint(equalToConstant: 41),
            
            checkButton.topAnchor.constraint(equalTo: sentenceTextField.bottomAnchor, constant: 50),
            checkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            checkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            checkButton.heightAnchor.constraint(equalToConstant: 41),
            
            nextButton.topAnchor.constraint(equalTo: checkButton.bottomAnchor, constant: 20),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            nextButton.heightAnchor.constraint(equalToConstant: 41)
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

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
