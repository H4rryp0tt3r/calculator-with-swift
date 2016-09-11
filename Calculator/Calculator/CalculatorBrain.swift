import Foundation

class CalculatorBrain {

    private var accumulator = 0.0

    private var operations = [
        "π": Operation.Constant(M_PI),
        "℮": Operation.Constant(M_E),
        "√": Operation.UnaryOperation(sqrt),
        "×": Operation.BinaryOperation { $0 * $1 },
        "+": Operation.BinaryOperation { $0 + $1 },
        "−": Operation.BinaryOperation { $0 - $1 },
        "÷": Operation.BinaryOperation { $0 / $1 },
        "=": Operation.Equals
    ]

    private var pendingOperation: PendingBinaryOperationInfo?

    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }

    func setOperand(operand: Double) {
        accumulator = operand
    }

    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
                case .Constant(let value):
                    accumulator = value
                    break
                case .UnaryOperation(let associatedFunction):
                    accumulator = associatedFunction(accumulator)
                    break
                case .BinaryOperation(let associatedFunction):
                    executePendingBinaryOperation()
                    pendingOperation = PendingBinaryOperationInfo(binaryFunction: associatedFunction, firstOperand: accumulator)
                    break
                case .Equals:
                    executePendingBinaryOperation()
                    break
            }
        }
    }

    private func executePendingBinaryOperation() {
        if let binaryFunction = pendingOperation?.binaryFunction, firstOperand = pendingOperation?.firstOperand {
            accumulator = binaryFunction(firstOperand, accumulator)
            pendingOperation = nil
        }
    }

    private 	struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }

    var result: Double {
        get {
            return accumulator
        }
    }

}