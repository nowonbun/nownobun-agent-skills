# skill-create-rule 스킬 설명

## 목적
- `SKILL.md` 계열 문서를 만들거나 수정할 때 형식, 규칙 강도, companion 산출물, 의미 보존 기준을 일관되게 적용하기 위한 스킬이다.

## 핵심 규칙
- skill 문서는 frontmatter, 필수 H1 섹션, 규칙 강도 표현을 `skill-create-rule` 기준에 맞춰 작성한다.
- Source of Truth는 단순 참조 목록이 아니라 충돌 해결 가이드로 작성한다.
- 외부 참조는 문서명만 적지 않고, 어떤 재사용 가능한 결정 경계를 그 문서가 맡는지와 왜 그 판단을 그 문서에 위임하는지를 함께 적는다.
- Source of Truth에는 일회성 사례, 임시 예외, 현재 개정에만 해당하는 의도, workflow-local 문맥을 근거로 넣지 않는다.
- skill 문서를 수정하면 Korean readme와 skill-scoped history를 같은 변경 세트에서 함께 갱신한다.

## 사용 시 주의
- Source of Truth를 과하게 구체화해서 현재 수정 건에만 맞는 설명으로 쓰면 안 된다.
- 반대로 다른 스킬 이름만 나열하고 결정 경계를 설명하지 않는 참조도 허용되지 않는다.
- companion 산출물이 없으면 완료로 보고하지 말고 먼저 생성해야 한다.
