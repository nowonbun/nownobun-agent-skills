# claude-review-runtime 스킬 설명

## 목적
- Claude 리뷰를 시작할 때 phase 적용성, preflight, handoff를 구조적으로 다루기 위한 runtime 스킬이다.

## 핵심 규칙
- 이 스킬은 review 진입 조건, phase 적용성, local preflight, protocol handoff를 맡는다.
- finding 정규화와 collaboration log 형식은 `claude-cross-review-protocol`, history 의무는 `skill-modify-history`가 맡는다.
- 리뷰 시작 조건과 리뷰 결과 표현 방식을 한 스킬에 섞지 않는다.

## 사용 시 주의
- runtime 진입 규칙과 history 생성 기준은 다른 결정 경계다.
- Source of Truth에는 handoff 이후 판단이 아니라 진입 전후의 경계만 적어야 한다.
