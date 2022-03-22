import Foundation

extension String {
    static func random(length: Int) -> String {
        let str = (0..<length).map { _ in
            String().randomElement()!
        }
        return String(str)
    }
}
