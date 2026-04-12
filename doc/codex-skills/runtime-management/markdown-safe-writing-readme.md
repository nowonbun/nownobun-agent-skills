# markdown-safe-writing 스킬 설명

## 목적
- Windows PowerShell을 거쳐 Markdown이나 일반 텍스트 문서를 수정할 때 한글 손상과 UTF-8 인코딩 문제를 예방하기 위한 스킬이다.

## 핵심 규칙
- 저장 인코딩만 맞추는 것으로 충분하다고 가정하지 않는다.
- 긴 한글 본문은 PowerShell here-string, 파이프, 표준입력으로 직접 전달하지 않는다.
- 문서 수정은 가능하면 `apply_patch`를 우선 사용하고, 그다음 ASCII-safe Python 쓰기, 마지막으로 제한된 PowerShell UTF-8 쓰기를 사용한다.
- 저장 후에는 바이트, UTF-8 디코딩, 비정상적인 `?` 반복, 대표 한글 문장 존재를 함께 검증한다.
- 콘솔 표시 깨짐과 실제 파일 손상을 분리해서 판단한다.

## 사용 시 주의
- `read_text(encoding='utf-8')`가 성공해도 한글이 `?`로 바뀌지 않았는지 별도로 확인해야 한다.
- 문서 손상 사고가 있었다면 정상 원문 기준으로 복구하고 관련 history를 남겨야 한다.
