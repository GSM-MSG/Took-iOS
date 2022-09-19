import CoreNFC

public final class NFCReader: NSObject, NFCNDEFReaderSessionDelegate {
    public var actualData: String?
    public var nfcSession: NFCNDEFReaderSession?
    public var action: ((String) -> Void)?

    public func scan(data actualData: String, action: @escaping (String) -> Void = { _ in }) {
        self.actualData = actualData
        self.action = action
        nfcSession = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        nfcSession?.alertMessage = "주변 Took을 실행한 기기와 가까이해주세요!"
        nfcSession?.begin()
    }

    public func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {}

    public func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {}

    public func readerSession(_ session: NFCNDEFReaderSession, didDetect tags: [NFCNDEFTag]) {
        if tags.count > 1 {
            let retryInterval: DispatchTimeInterval = .milliseconds(500)
            session.alertMessage = "1개 보다 많은 NFC 태그가 감지되었어요, 다시 시도해주세요!"
            DispatchQueue.global().asyncAfter(deadline: .now() + retryInterval) {
                session.restartPolling()
            }
            return
        }
        guard let tag = tags.first else { return }
        Task {
            do {
                try await session.connect(to: tag)
                let (status, _) = try await tag.queryNDEFStatus()
                switch status {
                case .readWrite:
                    try await tag.writeNDEF(
                        .init(records: [
                            .wellKnownTypeTextPayload(string: actualData ?? "", locale: .current)!
                        ])
                    )
                    let message = try await tag.readNDEF()
                    if let uuid = message.records.first?.wellKnownTypeTextPayload().0, let action = action {
                        action(uuid)
                    }
                    nfcInvalidateAlert(session: session, message: "전송에 성공했습니다!")
                default:
                    nfcInvalidateAlert(session: session, message: "NFC 태그에 연결할 수 없어요!")
                }
            } catch {
                nfcInvalidateAlert(session: session, message: "NFC 태그에 연결할 수 없어요!")
            }
        }
    }

    private func nfcInvalidateAlert(session: NFCNDEFReaderSession, message: String) {
        session.alertMessage = message
        session.invalidate()
    }
}
