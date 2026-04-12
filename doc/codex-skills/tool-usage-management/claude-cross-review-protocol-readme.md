# claude-cross-review-protocol 스킬 설명

## 목적
- Claude cross-review 호출, finding 정규화, collaboration log, NG/OK 출력 규칙을 표준화하기 위한 스킬이다.

## 핵심 규칙
- 이 스킬은 Claude review 호출 형식, finding 정규화, collaboration log, NG/OK 출력 규칙을 맡는다.
- timeout과 fallback 제어는 `ai-collaboration-governance`, 리뷰 정책 우선순위는 `CLAUDE`가 맡는다.
- runtime 제어와 review output 규칙을 분리해야 한다.

## 사용 시 주의
- retry나 timeout 기준을 이 스킬에 다시 쓰면 안 된다.
- Source of Truth에는 출력 규칙과 위임 경계를 함께 적어야 한다.
