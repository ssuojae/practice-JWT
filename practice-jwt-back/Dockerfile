# Node.js 20 버전의 이미지를 사용
FROM node:20

# 애플리케이션의 작업 디렉토리 설정
WORKDIR /usr/src/app

# package.json과 package-lock.json 파일을 먼저 복사해서, 의존성 설치 캐시 활용
COPY package*.json ./

# npm을 이용해 의존성 설치 (도커 컨테이너 내에서 실행)
RUN npm install

# 나머지 소스 파일 전체를 복사
COPY . .

# 애플리케이션 포트를 외부에 노출 (3000 포트)
EXPOSE 3000

# 애플리케이션 실행 명령어 (개발용)
CMD ["npm", "run", "start:dev"]
