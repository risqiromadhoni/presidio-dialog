FROM ghcr.io/data-privacy-stack/presidio-analyzer:2.2.364

USER root

# Custom Presidio analyzer configuration.
COPY configs/analyzer.yaml /app/analyzer.yaml
COPY configs/nlp_engine.yaml /app/nlp_engine.yaml
# COPY configs/recognizer_registry.yaml /app/recognizer_registry.yaml

# Install Dutch spaCy model.
#
# The official Presidio analyzer image already contains the English
# en_core_web_lg model. We only need to add the Dutch model.
RUN python -m spacy download nl_core_news_lg

# Keep Presidio's normal non-root runtime user.
USER 1001
