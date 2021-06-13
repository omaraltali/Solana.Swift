import Foundation
import RxSwift

extension Solana {
    func getInflationGovernor(commitment: Commitment? = nil) -> Single<InflationGovernor> {
        Single.create { emitter in
            self.getInflationGovernor(commitment: commitment) {
                switch $0 {
                case .success(let governor):
                    emitter(.success(governor))
                case .failure(let error):
                    emitter(.failure(error))
                }
            }
            return Disposables.create()
        }
    }
}
