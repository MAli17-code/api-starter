FROM python:3.12-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

COPY pyproject.toml uv.lock README.md ./

COPY src ./src

ENV PATH="/app/.venv/bin:$PATH"

ENV PYTHONUNBUFFERED=1

RUN uv sync --frozen

EXPOSE 8000

CMD ["uvicorn", "api_starter.main:app","--host","0.0.0.0", "--port", "8000"]