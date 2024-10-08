
## JWT 인코딩과 디코딩 원리

### 1. **JWT란?**
- **JWT (JSON Web Token)** 는 서버와 클라이언트 간의 인증 정보를 안전하게 전송하기 위해 사용되는 토큰이다.
- JWT는 **세 가지 부분**으로 나뉘어진다: 
  1. **Header (헤더)**: 토큰의 타입과 해시 알고리즘 정보를 포함
  2. **Payload (페이로드)**: 유저 정보나 클레임(Claims)과 같은 데이터를 담고 있음
  3. **Signature (서명)**: 토큰이 변조되지 않았는지 확인하기 위한 무결성 체크를 위한 서명

### 2. **Base64 인코딩**
- JWT는 **Base64**로 인코딩된 문자열이다.
- **Base64**는 이진 데이터를 **텍스트로 변환**하는 방식으로, 데이터를 텍스트로 변환하여 웹 전송을 가능하게 한다.
- Base64 인코딩은 데이터를 **암호화하지 않으며**, 누구나 디코딩할 수 있다.

### 3. **JWT의 구성**

<img width="400" alt="image" src="https://github.com/user-attachments/assets/f53a25c8-65df-4340-86d1-e154d696985b">

- JWT는 아래와 같은 구조로 구성된다:
  ```
  <헤더>.<페이로드>.<서명>
  ```
- 예시:
  ```
  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6Ikpvb2UgRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
  ```

### 4. **Header (헤더)**
- 헤더는 JWT의 타입과 **알고리즘 정보**를 포함한다. 보통 `alg`(알고리즘)와 `typ`(토큰 타입)이 포함
- 예시:
  ```json
  {
    "alg": "HS256",
    "typ": "JWT"
  }
  ```

### 5. **Payload (페이로드)**
- 페이로드에는 **유저 정보**나 **클레임**(Claims)이 담겨 있다.
- 클레임은 사용자의 고유 ID, 이름 등과 같은 정보를 포함하며, 이는 서버와 클라이언트가 주고받는 유용한 데이터
- 예시:
  ```json
  {
    "sub": "1234567890",
    "name": "John Doe",
    "admin": true
  }
  ```

### 6. **Signature (서명)**
- 서명은 JWT가 변조되지 않았다는 것을 확인하기 위한 **무결성 체크** 이다.
- 서명은 **헤더**와 **페이로드**를 특정한 **비밀 키**로 해싱하여 생성된다.
- 예시:
  ```text
  HMACSHA256(
    base64UrlEncode(header) + "." + base64UrlEncode(payload),
    secret)
  ```

### 7. **JWT의 보안**
- **Base64 인코딩**은 암호화가 아니며, 쉽게 디코딩할 수 있다.
- 따라서, JWT는 **서명(Signature)** 을 통해 데이터가 변조되지 않았다는 것을 보장할 수 있다.
- 민감한 정보는 JWT에 **암호화되지 않은 상태**로 저장하면 안 되며, **HTTPS**와 같은 보안 프로토콜을 통해 전송해야 한다.

### 8. **JWT와 데이터 무결성**
- JWT는 데이터의 무결성을 확인하기 위해 **서명**을 사용
- 서명 덕분에 JWT가 **변조되지 않았는지**를 확인할 수 있으며, 이를 통해 **안전한 인증**을 수행할 수 있다.
- 서명이 없으면 JWT 안의 데이터는 쉽게 노출되고 변조될 수 있기 때문에, **무결성을 보장**하는 서명이 필수적!
