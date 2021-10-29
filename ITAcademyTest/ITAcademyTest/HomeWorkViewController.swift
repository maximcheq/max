import UIKit

class HomeWorkViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    var counter = 0 {
        didSet {
            updateLabel()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func Button(_ sender: UIButton) {
        counter = sender.tag
    }


func updateLabel() {
    Label.text = "\(counter)"
}
}
     
