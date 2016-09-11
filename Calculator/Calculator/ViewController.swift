import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!

    @IBAction func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        print("Digit Pressed: \(digit)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}