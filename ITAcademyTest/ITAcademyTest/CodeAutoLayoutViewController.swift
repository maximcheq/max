import UIKit

class CodeAutoLayoutViewController: UIViewController {

    lazy var firstLabel = UILabel()
    lazy var secondLabel = UILabel()
    lazy var thirdLabel = UILabel()
    lazy var fourthLabel = UILabel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
        self.view.backgroundColor = .black
    }

        func setupUI() {
            firstLabel.text = "1"
            firstLabel.textColor = .white
            firstLabel.textAlignment = .center
            firstLabel.font = UIFont.systemFont(ofSize: 55)
            firstLabel.layer.cornerRadius = 10
            firstLabel.layer.masksToBounds = true
            firstLabel.backgroundColor = .gray
            
            secondLabel.text = "2"
            secondLabel.textColor = .white
            secondLabel.textAlignment = .center
            secondLabel.font = UIFont.systemFont(ofSize: 55)
            secondLabel.layer.cornerRadius = 10
            secondLabel.clipsToBounds = true
            secondLabel.backgroundColor = .gray
            
            thirdLabel.text = "3"
            thirdLabel.textColor = .white
            thirdLabel.textAlignment = .center
            thirdLabel.font = UIFont.systemFont(ofSize: 55)
            thirdLabel.layer.cornerRadius = 10
            thirdLabel.clipsToBounds = true
            thirdLabel.backgroundColor = .gray
            
            fourthLabel.text = "4"
            fourthLabel.textColor = .white
            fourthLabel.textAlignment = .center
            fourthLabel.font = UIFont.systemFont(ofSize: 55)
            fourthLabel.layer.cornerRadius = 10
            fourthLabel.clipsToBounds = true
            fourthLabel.backgroundColor = .gray
    
        }
        func setupLayout () {
            firstLabel.translatesAutoresizingMaskIntoConstraints = false
            secondLabel.translatesAutoresizingMaskIntoConstraints = false
            thirdLabel.translatesAutoresizingMaskIntoConstraints = false
            fourthLabel.translatesAutoresizingMaskIntoConstraints = false

            view.addSubview(firstLabel)
            view.addSubview(secondLabel)
            view.addSubview(thirdLabel)
            view.addSubview(fourthLabel)

            firstLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            firstLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
            firstLabel.heightAnchor.constraint(equalTo: secondLabel.widthAnchor, multiplier: 1.0/1.0).isActive = true
            firstLabel.widthAnchor.constraint(equalTo: secondLabel.heightAnchor, multiplier: 1.0/1.0).isActive = true
            
            secondLabel.leadingAnchor.constraint(equalTo: firstLabel.trailingAnchor, constant: 20).isActive = true
            secondLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
            secondLabel.heightAnchor.constraint(equalTo: thirdLabel.widthAnchor, multiplier: 1.0/1.0).isActive = true
            secondLabel.widthAnchor.constraint(equalTo: thirdLabel.heightAnchor, multiplier: 1.0/1.0).isActive = true
            
            thirdLabel.leadingAnchor.constraint(equalTo: secondLabel.trailingAnchor, constant: 20).isActive = true
            thirdLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
            thirdLabel.heightAnchor.constraint(equalTo: fourthLabel.widthAnchor, multiplier: 1.0/1.0).isActive = true
            thirdLabel.widthAnchor.constraint(equalTo: fourthLabel.heightAnchor, multiplier: 1.0/1.0).isActive = true
            
            fourthLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            fourthLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
            fourthLabel.leadingAnchor.constraint(equalTo: thirdLabel.trailingAnchor, constant: 20).isActive = true
            fourthLabel.heightAnchor.constraint(equalTo: fourthLabel.widthAnchor, multiplier: 1.0/1.0).isActive = true
            
        }

}
