import Foundation

import RxSwift

extension AsyncThrowingStream {
    func map<Result>(_ transform: @escaping (Element) throws -> Result) -> AsyncThrowingStream<Result, Error> {
        return self.asObservable().map(transform).values
    }
}
