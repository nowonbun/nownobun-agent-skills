# ai-collaboration-governance 스킬 설명

## 목적
- Claude MCP 협업에서 timeout, fallback, 요청 크기 제어를 일관되게 적용하기 위한 runtime 제어 스킬이다.

## 핵심 규칙
- 이 스킬은 timeout 처리, fallback 흐름, 요청 크기 제어를 맡는다.
- 리뷰 결과 포맷과 finding 정규화는 `claude-cross-review-protocol`, 리뷰 우선순위 프로필은 `CLAUDE`가 맡는다.
- runtime 제어와 리뷰 출력 구조를 분리해야 한다.

## 사용 시 주의
- timeout 대응과 리뷰 로그 포맷은 다른 결정 경계다.
- Source of Truth에는 어떤 런타임 제어를 이 스킬이 맡는지 분명히 적어야 한다.
