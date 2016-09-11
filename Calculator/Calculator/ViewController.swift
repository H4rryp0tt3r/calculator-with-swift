import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var display: UILabel!
    private var userInTheMiddleOfTyping = false

    private var calculatorBrain = CalculatorBrain()

    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }

    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!

        if userInTheMiddleOfTyping {
            let textInCurrentDisplay = display.text!
            display.text = textInCurrentDisplay + digit
        } else {
            display.text = digit
        }

        userInTheMiddleOfTyping = true
    }

    @IBAction private func performOperation(sender: UIButton) {
        userInTheMiddleOfTyping = false
        if let mathSymbol = sender.currentTitle {
            calculatorBrain.setOperand(displayValue)
            calculatorBrain.performOperation(mathSymbol)
        }
        displayValue = calculatorBrain.result
    }
}
