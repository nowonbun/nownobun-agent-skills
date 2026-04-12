# mariadb-mcp 스킬 설명

## 목적
- MariaDB MCP 사용 시 연결 범위, SQL 검증, read/write 권한 처리 규칙을 명확히 하기 위한 스킬이다.

## 핵심 규칙
- 이 스킬은 연결 범위 확인, SQL 검증, read/write 권한 처리를 맡는다.
- workspace trigger와 stop 조건은 `AGENTS`, 공통 MCP 검증과 보고 제어는 `work-runtime`이 맡는다.
- SQL 유효성 판단과 워크플로 진입 허용 여부를 분리해야 한다.

## 사용 시 주의
- Source of Truth에는 데이터베이스 고유 판단과 공통 runtime 판단을 섞지 말아야 한다.
- 권한 검증과 절차적 stop 조건은 각각 다른 문서에서 본다.
