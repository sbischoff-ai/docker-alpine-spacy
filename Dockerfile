FROM python:3.7-alpine as base

# Install c++ binary dependencies
RUN apk add --no-cache libstdc++

# Build environment
FROM base as builder

RUN apk --update add gcc g++

RUN mkdir /install
WORKDIR /install

COPY requirements.txt /requirements.txt
RUN pip install --install-option="--prefix=/install" -r /requirements.txt

# Final image
FROM base

COPY --from=builder /install /usr/local
RUN python -m spacy link de_core_news_sm de
