# 🛒 쇼핑 리스트 앱

바닐라 HTML/CSS/JavaScript로 만든 단일 파일 쇼핑 리스트 웹 앱입니다. 데이터는 Supabase 데이터베이스(`shopping_items` 테이블)에 저장됩니다.

## 기능

- 아이템 추가 / 체크(완료 표시) / 삭제
- 체크된 항목 일괄 삭제
- 총 개수 · 완료 · 남은 개수 요약 표시
- Supabase에 자동 저장 (어느 기기에서 열어도 같은 목록 유지)
- 예전 `localStorage` 데이터는 최초 실행 시 자동으로 DB로 이전
- 라이트/다크 모드 자동 지원 (`color-scheme` + `light-dark()`)

## 사용 방법

`index.html` 파일을 브라우저에서 열면 바로 사용할 수 있습니다. 별도의 빌드나 서버가 필요 없습니다. (Supabase JS 클라이언트는 CDN에서 로드됩니다.)

## 데이터베이스

`supabase/migrations/create_shopping_items.sql`에 테이블 정의와 RLS 정책이 있습니다.

| 컬럼 | 타입 | 설명 |
|---|---|---|
| id | uuid (PK) | 자동 생성 |
| name | text | 아이템 이름 (1~100자) |
| done | boolean | 완료 여부 |
| created_at | timestamptz | 생성 시각 |

로그인 없이 쓰는 공개 앱이므로 `anon` 역할에 select/insert/update/delete를 허용하는 RLS 정책이 적용되어 있습니다. 코드에 들어 있는 키는 클라이언트 노출용 publishable key입니다.
