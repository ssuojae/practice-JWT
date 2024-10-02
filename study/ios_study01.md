## Keychain에 대한 설명

<br/>

### Keychain과 UserDefaults 비교

| **특징**             | **Keychain**                                                 | **UserDefaults**                                           |
|----------------------|--------------------------------------------------------------|------------------------------------------------------------|
| **보안성**           | **암호화**를 통해 데이터 보호가 이루어지며, 민감한 정보를 안전하게 관리함 | 암호화 없이 데이터를 저장하므로, 앱 내 데이터를 쉽게 노출시킬 수 있음 |
| **영속성**           | 앱 삭제 후에도 데이터가 남아 있을 수 있음 (특히 iCloud Keychain 사용 시) | 앱이 삭제되면 데이터도 함께 삭제됨                               |
| **자동 동기화**      | 기본적으로 기기 간 동기화되지 않음                            | iCloud 동기화를 통해 기기 간 데이터 동기화 가능              |
| **사용 시나리오**    | 비밀번호, 토큰, 인증서 등 보안이 필수적인 민감한 데이터 저장 | 사용자 환경 설정, 앱 상태 정보 등 보안이 덜 중요한 정보 저장 |

<br/>

### Keychain이 더 안전한 이유

<img src="https://github.com/user-attachments/assets/d7f16938-e2ce-4f08-a04b-e57e0235e176" width="400">
<img src="https://github.com/user-attachments/assets/8c33b313-7d04-4188-b898-8f9a4a276bc3" width="300">


1. **암호화 기술 적용**: Keychain에 저장된 데이터는 기본적으로 운영체제 레벨에서 암호화된다. 이는 데이터를 암호화하지 않고 그대로 저장하는 UserDefaults와의 가장 큰 차이점이다. 암호화된 데이터는 키를 가지고 있는 사용자만 복호화할 수 있기 때문에 외부에서 접근하거나 해킹 시에도 안전하다. 

2. **운영체제의 격리**: Keychain은 운영체제 수준에서 앱과 데이터를 격리하여 관리한다. 각 앱은 독립적으로 Keychain에 접근하며, 한 앱이 다른 앱의 Keychain 데이터를 접근할 수 없다. 반면 UserDefaults는 앱의 샌드박스 안에서 데이터를 관리하며, 보안이 보장되지 않은 데이터는 쉽게 노출될 가능성이 있다. 즉, Keychain은 각 앱마다 독립적인 보안 환경을 제공하여 데이터를 보호한다.

3. **데이터 접근 제어**: Keychain을 통해 저장된 데이터는 사용자가 앱에 로그인을 하거나 인증을 거쳤을 때만 접근할 수 있도록 제한할 수 있다. Touch ID나 Face ID 같은 생체 인증과 함께 사용할 수 있어 보안성을 높일 수 있다. 반면 UserDefaults는 데이터 접근에 대한 이러한 제어가 불가능하며, 단순히 앱 내부에서 데이터를 저장하고 읽어오는 역할만 한다.

<br/>

### 언제 사용하면 좋은지
- **UserDefaults**: 사용자 환경 설정, 앱의 기본값 설정, 앱의 상태 저장 등 **보안이 중요하지 않은 정보**를 저장할 때 적합하다. 예를 들어, 마지막으로 로그인한 사용자의 이름이나 앱에서 마지막으로 재생한 콘텐츠 위치 등을 저장할 때 적합하다.
- **Keychain**: 비밀번호, 암호화 키, 인증서, **JWT 토큰과 같은 보안이 중요한 데이터**를 저장할 때 사용한다. 특히, 사용자 인증과 관련된 데이터나 중요한 개인 정보를 저장할 때 필수적이다.

<br/>

### Keychain을 사용하는 이유 (JWT 토큰 관리)
JWT 토큰을 클라이언트 측에 저장할 때, 보안이 중요한 이유는 토큰이 사용자 인증과 권한 부여에 중요한 역할을 하기 때문이다. 이 토큰이 외부에 노출되면 공격자가 사용자로 가장할 수 있는 위험이 있다. Keychain은 이러한 민감한 정보를 안전하게 관리할 수 있는 방법을 제공하므로, 클라이언트에 JWT 토큰을 저장할 때 가장 적합한 저장소이다.

JWT 토큰을 Keychain에 저장함으로써:
- **토큰 탈취 방지**: Keychain은 운영체제 레벨에서 암호화를 적용하므로, 외부에서 토큰을 탈취하는 것이 매우 어렵다. 이로 인해 JWT 토큰과 같은 민감한 정보가 외부로 노출될 위험을 최소화할 수 있다.
- **데이터 무결성**: JWT 토큰의 무결성을 보장하며, 사용자 세션 관리를 쉽게 할 수 있다. Keychain을 사용하면 무단 변경을 방지할 수 있으며, 데이터의 일관성을 유지할 수 있다.

<br/>

### 간단한 Keychain 사용 예제 (JWT 토큰 저장)

```swift
import Security

func storeJWTToken(token: String) -> OSStatus {
    let tokenData = token.data(using: .utf8)!
    
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: "jwtToken",
        kSecValueData as String: tokenData
    ]
    
    // 기존 토큰이 있는지 확인하고 있다면 삭제
    SecItemDelete(query as CFDictionary)
    
    // 새로운 토큰 저장
    return SecItemAdd(query as CFDictionary, nil)
}

func retrieveJWTToken() -> String? {
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: "jwtToken",
        kSecReturnData as String: true,
        kSecMatchLimit as String: kSecMatchLimitOne
    ]
    
    var item: CFTypeRef?
    let status = SecItemCopyMatching(query as CFDictionary, &item)
    
    guard status == errSecSuccess, let data = item as? Data else {
        return nil
    }
    
    return String(data: data, encoding: .utf8)
}
```

**Keychain은 단순히 보안이 좋은 것이 아니라, 운영체제의 암호화와 앱 간 데이터 격리를 통해 민감한 정보를 안전하게 관리할 수 있다. 특히, JWT 토큰과 같은 민감한 정보를 다룰 때 이러한 보안 기능은 필수적이 생각한다.**

