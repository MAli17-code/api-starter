from fastapi import FastAPI

app = FastAPI(
    title="API Starter",
    version="0.1.0",
)


@app.get("/health")
async def health():
    return {
        "status": "ok",
        "version": app.version,
    }