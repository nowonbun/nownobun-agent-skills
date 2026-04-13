# constitution-rule 스킬 설명

## 목적
- `global_instructions`와 `AGENTS`를 만들거나 수정할 때 헌법 계층, 우선순위, 금지 규칙, 운영 경계를 일관되게 정의하기 위한 스킬이다.

## 핵심 규칙
- 헌법 계층은 global/workspace 두 개만 허용하고 `global_instructions` > `AGENTS` 우선순위를 유지한다.
- 전역 원칙, 안전 규칙, 금지 행위는 `global_instructions`에 두고, 실행 트리거와 폴더 운영 규칙은 `AGENTS`에 둔다.
- 모든 워크플로는 trigger, execution order, stop conditions, failure report, re-run 조건을 포함해야 한다.
- MCP 규칙은 source verification, parameter validation, post-action reporting을 포함해야 한다.

## 사용 시 주의
- 스킬 문서 형식 자체는 `skill-create-rule`이 담당하므로 이 문서에 형식 규칙을 중복 정의하면 안 된다.
- history 생성 여부는 `skill-modify-history`를 따라야 하며, 이 문서에서 자체 기준을 만들면 안 된다.
- workspace 세부 규칙을 `global_instructions`로 올리거나, 전역 원칙을 `AGENTS`로 내리면 계층 혼합 오류가 된다.
