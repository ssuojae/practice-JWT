import Foundation
import Security

final class KeychainStorage {

    func save(key: String, data: Data) -> Bool {
        // 기존에 저장된 항목 있으면 삭제
        let query = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ] as [String: Any]

        SecItemDelete(query as CFDictionary)

        // 새로운 항목 추가
        let attributes = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ] as [String: Any]

        let status = SecItemAdd(attributes as CFDictionary, nil)
        return status == errSecSuccess
    }

    func load(key: String) -> Data? {
        let query = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ] as [String: Any]

        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == errSecSuccess, let retrievedData = dataTypeRef as? Data {
            return retrievedData
        } else {
            return nil
        }
    }

    func delete(key: String) -> Bool {
        let query = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ] as [String: Any]

        let status = SecItemDelete(query as CFDictionary)
        return status == errSecSuccess
    }
}
