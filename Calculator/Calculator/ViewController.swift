import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    private var userInTheMiddleOfTyping = false

    @IBAction func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!

        if userInTheMiddleOfTyping {
            let textInCurrentDisplay = display.text!
            display.text = textInCurrentDisplay + digit
        } else {
            display.text = digit
        }

        userInTheMiddleOfTyping = true
    }

    @IBAction func performOperation(sender: UIButton) {
        if let mathSymbol = sender.currentTitle {
            if mathSymbol == "π" {
                display.text = String(M_PI)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
