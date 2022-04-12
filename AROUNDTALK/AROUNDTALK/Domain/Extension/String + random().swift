import Foundation

extension String {
    static func random(length: Int) -> String {
        let str = (0..<length).map { _ in
            """
            ABCDEFGHIJKLMNOPQRSTUVWXYZ
            abcdefghijklmnopqrstuvwxyz
            1234567890
            """.randomElement()!
        }
        return String(str)
    }
}
