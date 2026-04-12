# github-mcp 스킬 설명

## 목적
- GitHub MCP 사용 시 대상 검증, API와 git CLI 역할 분리, write 처리 규칙을 명확히 하기 위한 스킬이다.

## 핵심 규칙
- 이 스킬은 GitHub 대상 검증, API와 git CLI 역할 분리, GitHub write 처리 규칙을 맡는다.
- workspace trigger와 stop 조건은 `AGENTS`, 공통 MCP 사전 검증은 `work-runtime`이 맡는다.
- 로컬 git 작업과 원격 GitHub API 작업을 같은 범주로 취급하지 않는다.

## 사용 시 주의
- Source of Truth에는 GitHub 고유 판단과 공통 runtime 판단을 분리해서 적어야 한다.
- 대상 ID 검증과 워크플로 허용 여부는 다른 판단이다.
