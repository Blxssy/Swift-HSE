import UIKit

class SettingsViewController: UIViewController {
    weak var delegate: SettingsDelegate?
    
    var user: User?
    
    private var firstNameField: UITextField!
    private var secondNameField: UITextField!
    private var ageField: UITextField!
    private var hobbyField: UITextField!
    private var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        setTextFields()
        setButton()
    }
    
    private func setTextFields() {
        firstNameField = UITextField()
        firstNameField.translatesAutoresizingMaskIntoConstraints = false
        firstNameField.borderStyle = .roundedRect
        firstNameField.placeholder = "First name"
        firstNameField.text = user?.firstName
        view.addSubview(firstNameField)
        
        secondNameField = UITextField()
        secondNameField.translatesAutoresizingMaskIntoConstraints = false
        secondNameField.borderStyle = .roundedRect
        secondNameField.placeholder = "Second name"
        secondNameField.text = user?.secondName
        view.addSubview(secondNameField)
        
        ageField = UITextField()
        ageField.translatesAutoresizingMaskIntoConstraints = false
        ageField.borderStyle = .roundedRect
        ageField.placeholder = "Age"
        ageField.text = user?.age
        view.addSubview(ageField)
    
        hobbyField = UITextField()
        hobbyField.translatesAutoresizingMaskIntoConstraints = false
        hobbyField.borderStyle = .roundedRect
        hobbyField.placeholder = "Hobby"
        hobbyField.text = user?.hobby
        view.addSubview(hobbyField)
        
        NSLayoutConstraint.activate([
            firstNameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            firstNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            secondNameField.topAnchor.constraint(equalTo: firstNameField.bottomAnchor, constant: 20),
            secondNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            secondNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            ageField.topAnchor.constraint(equalTo: secondNameField.bottomAnchor, constant: 20),
            ageField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ageField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            hobbyField.topAnchor.constraint(equalTo: ageField.bottomAnchor, constant: 20),
            hobbyField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            hobbyField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        }
    
    private func setButton() {
        saveButton = UIButton(type: .system)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = .white
        saveButton.tintColor = .lightGray
        saveButton.layer.cornerRadius = 10
        saveButton.clipsToBounds = false
        
        saveButton.addAction(
            .init { [weak self] _ in
                self?.saveData()
            }, for: .touchUpInside
        )
        view.addSubview(saveButton)
        
    
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            saveButton.widthAnchor.constraint(equalToConstant: 150),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func saveData() {
        guard let updatedFirstName = firstNameField.text,
                let updatedSecondName = secondNameField.text,
                let updatedAge = ageField.text,
                let updatedHobby = hobbyField.text
        else { return }
        
        let updatedUser = User(firstName: updatedFirstName, secondName: updatedSecondName, age: updatedAge, hobby: updatedHobby)
        delegate?.UpdateData(user: updatedUser)
        navigationController?.popViewController(animated: true)
    }
}
