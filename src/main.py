from flask import Flask
import os, socket

app = Flask(__name__)

@app.get("/")
def hello():
    host = socket.gethostname()
    return f"Hello from Flask! Host: {host}\n"

@app.get("/healthz")
def health():
    return "ok\n", 200

@app.get("/readyz")
def ready():
    return "ready\n", 200

if __name__ == "__main__":
    port = int(os.getenv("PORT", "8080"))
    app.run(host="0.0.0.0", port=port)
