FROM python:3.13-slim
RUN apt-get update && apt-get install -y --no-install-recommends g++ make && rm -rf /var/lib/apt/lists/*
WORKDIR /work
COPY . .
RUN python -m pip install --no-cache-dir -e .[dev] && make build-engines
CMD ["python", "scripts/verify_current_release.py"]
