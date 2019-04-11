# docker-alpine-spacy
A minimal docker base image for python 3.7 applications that use the SpaCy NLP library (de)

The German Model will have to be loaded via:

```python
import spacy

nlp = spacy.load('de_core_news_sm')
```
