# stock-mcp 스킬 설명

## 목적
- Stock MCP 사용 시 시장/날짜 파라미터 검증, 도구 선택, 질의 의도 보고를 명확히 하기 위한 스킬이다.

## 핵심 규칙
- 이 스킬은 시장/날짜 파라미터 검증, 주식 도구 선택, 질의 의도 보고를 맡는다.
- workspace trigger와 stop 조건은 `AGENTS`, 공통 MCP 검증은 `work-runtime`이 맡는다.
- 데이터 조회 규칙과 서술형 분석 구조를 같은 판단으로 다루지 않는다.

## 사용 시 주의
- stock-analysis와 stock-mcp는 목적이 다르므로 Source of Truth 경계를 분리해야 한다.
- 공통 runtime 규칙을 이 스킬에 다시 정의하면 안 된다.
