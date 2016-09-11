import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    private var userInTheMiddleOfTyping = false

    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }

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
        userInTheMiddleOfTyping = false
        if let mathSymbol = sender.currentTitle {
            if mathSymbol == "π" {
                displayValue = M_PI
            } else if mathSymbol == "√" {
                displayValue = sqrt(displayValue)
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
