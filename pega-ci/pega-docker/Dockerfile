# -----------------------------
# Base Pega image (Java 11)
# -----------------------------
FROM eclipse-temurin:11-jre-jammy

# -----------------------------
# Metadata
# -----------------------------
LABEL app="pega-customer"
LABEL exportedArtifact="Customer_010101_20260121T152131_GMT.zip"
LABEL version="2.3.1"

# -----------------------------
# Install unzip
# -----------------------------
RUN apt-get update && \
    apt-get install -y unzip && \
    rm -rf /var/lib/apt/lists/*

# -----------------------------
# Create Pega directory structure
# -----------------------------
RUN mkdir -p /opt/pega/artifacts /opt/pega/runtime
WORKDIR /opt/pega

# -----------------------------
# Copy Pega rules artifact
# -----------------------------
COPY Customer_010101_20260121T152131_GMT.zip /opt/pega/artifacts/

# -----------------------------
# Validate and "simulate" Pega rules import
# -----------------------------
RUN echo "Validating Pega artifact..." && \
    unzip -t /opt/pega/artifacts/Customer_010101_20260121T152131_GMT.zip && \
    echo "Simulating Pega rules import..." && \
    unzip /opt/pega/artifacts/Customer_010101_20260121T152131_GMT.zip -d /opt/pega/runtime && \
    echo "Pega rules imported successfully"

# -----------------------------
# Expose application port
# -----------------------------
EXPOSE 8080

# -----------------------------
# Keep container running (simulation)
# -----------------------------
CMD ["bash", "-c", "echo 'Pega Customer App simulation running...'; sleep infinity"]
