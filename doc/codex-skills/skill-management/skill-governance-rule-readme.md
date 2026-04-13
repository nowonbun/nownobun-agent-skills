# skill-governance-rule 스킬 설명

## 목적
- 스킬 거버넌스를 설계하거나 수정할 때 baseline/strict 티어와 strict trigger를 닫힌 규칙으로 관리하기 위한 스킬이다.

## 핵심 규칙
- 거버넌스 티어는 `baseline`, `strict` 두 개만 허용한다.
- destructive operation, 외부 서비스 write, 인증/권한, 배포·런타임·외부 API 변경이 있으면 strict를 선택해야 한다.
- strict에서는 actor, approval, rollback, failure handling, verification을 trigger별로 정의해야 한다.
- baseline에서는 최소 실행 경로, 완료 검증, 실패 보고 경로만 요구하고 strict 전용 통제를 섞으면 안 된다.

## 사용 시 주의
- 형식 규칙은 `skill-create-rule`이 담당하므로 이 문서에 markdown 구조 요구를 중복 정의하면 안 된다.
- strict trigger는 닫힌 목록이므로 임의로 새 트리거를 추가하면 안 된다.
- `high risk` 같은 모호한 레이블은 결정 기준 없이 쓰면 안 된다.
