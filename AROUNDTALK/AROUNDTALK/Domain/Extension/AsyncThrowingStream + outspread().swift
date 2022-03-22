import Foundation

import RxSwift

extension AsyncThrowingStream where Element: Sequence {
    func outspread() -> AsyncThrowingStream<Element.Element , Error> {
        return self.asObservable().flatMap { sequenceElement in
            return Observable<Element.Element>.create { observable in
                sequenceElement.forEach {
                    observable.onNext($0)
                }
                return Disposables.create()
            }
        }.values
    }
}
