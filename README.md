# 한끼가볍게

바쁜 1인 가구 직장인을 위한 간단 요리 추천과 식사 기록 MVP입니다.

- 보유 재료로 1인분 레시피 추천
- 음식 사진과 예상 칼로리 기록 (음식·양 직접 선택)
- 이름·연락처·남긴 말 신청 접수 (Supabase)

사이트: https://hankki-light-mvp.vercel.app

## 실행 및 배포

`index.html`을 브라우저에서 열거나 `python3 -m http.server 8000`으로 미리 봅니다.
Vercel은 `main`에 푸시하면 `index.html`만 `public/`에 복사해 자동 배포합니다.

수정 후: `git add . && git commit -m "사이트 수정" && git push origin main`

## 신청 저장 보안

브라우저에는 Supabase 공개 publishable 키만 있습니다. `applications` 표의 RLS와 열별 INSERT 권한으로 신청 추가만 허용합니다. 일반 브라우저에서는 신청 조회·수정·삭제가 금지됩니다.

비공개 키와 환경변수 파일, CLI 로그인 정보는 Git에 올리지 않습니다.
