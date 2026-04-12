# coding-assistant 스킬 설명

## 목적
- 코드 변경 작업에서 조정, 위험 정리, 로컬 검증 계획, 리뷰 handoff를 구조화하기 위한 스킬이다.

## 핵심 규칙
- 이 스킬은 코딩 변경 조정, 변경 위험 정리, 로컬 검증 계획, 리뷰 handoff 구조를 맡는다.
- Claude 리뷰 실행 방법은 `claude-review-runtime`, 리뷰 결과 형식과 로그 스키마는 `claude-cross-review-protocol`이 맡는다.
- 코드 변경 계획과 리뷰 출력 포맷을 같은 판단으로 섞지 않아야 한다.

## 사용 시 주의
- 로컬 검증 범위와 Claude 리뷰 실행 규칙을 혼동하면 안 된다.
- Source of Truth에는 실행 경계와 위임 이유를 같이 써야 한다.
