import UIKit

protocol SettingsDelegate: AnyObject {
    func UpdateData(user: User)
}

class UserViewController: UIViewController {
    private var firstNameLabel: UILabel!
    private var secondNameLabel: UILabel!
    private var ageLabel: UILabel!
    private var hobbyLabel: UILabel!
    private var settingsButton: UIButton!
    
    var user: User = User(firstName: "", secondName: "", age: "", hobby: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setLabels()
        setButtons()
    }
    
    private func setLabels() {
        firstNameLabel = UILabel()
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel.text = "First name: \(user.firstName)"
        view.addSubview(firstNameLabel)
        
        secondNameLabel = UILabel()
        secondNameLabel.translatesAutoresizingMaskIntoConstraints = false
        secondNameLabel.text = "Second name: \(user.secondName)"
        view.addSubview(secondNameLabel)
        
        ageLabel = UILabel()
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.text = "Age: \(user.age)"
        view.addSubview(ageLabel)
        
        hobbyLabel = UILabel()
        hobbyLabel.translatesAutoresizingMaskIntoConstraints = false
        hobbyLabel.text = "Hobby: \(user.hobby)"
        view.addSubview(hobbyLabel)
        
        NSLayoutConstraint.activate([
                    firstNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                    firstNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    firstNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    
                    secondNameLabel.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 20),
                    secondNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    secondNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    
                    ageLabel.topAnchor.constraint(equalTo: secondNameLabel.bottomAnchor, constant: 20),
                    ageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    ageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    
                    hobbyLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 20),
                    hobbyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    hobbyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
                ])
    }
    
    private func setButtons() {
        settingsButton = UIButton(type: .system)
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.setTitle("Settings", for: .normal)
        settingsButton.backgroundColor = .lightGray
        settingsButton.tintColor = .white
        settingsButton.layer.cornerRadius = 10
        settingsButton.clipsToBounds = false
        
        
        settingsButton.addAction(
            .init { [weak self] _ in
                self?.changeScreen()
            }, for: .touchUpInside
            )
        
        view.addSubview(settingsButton)
        
        NSLayoutConstraint.activate([
                    settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    settingsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
                    settingsButton.widthAnchor.constraint(equalToConstant: 150),
                    settingsButton.heightAnchor.constraint(equalToConstant: 50)
                ])
    }
    
    private func updateLabels() {
        firstNameLabel.text = "First name: \(user.firstName)"
        secondNameLabel.text = "Second name: \(user.secondName)"
        ageLabel.text = "Age: \(user.age)"
        hobbyLabel.text = "Hobby: \(user.hobby)"
    }
    
    private func changeScreen() {
        let settingsVC = SettingsViewController()
        settingsVC.delegate = self
        settingsVC.user = self.user
        navigationController?.pushViewController(settingsVC, animated: true)
    }
}

extension UserViewController: SettingsDelegate {
    func UpdateData(user: User) {
        self.user = user
        updateLabels()
    }
}
