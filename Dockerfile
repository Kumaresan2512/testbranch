# Define function directory
ARG FUNCTION_DIR="."

FROM python:3.9
ENV LTP_PATH "${FUNCTION_DIR}/languagetool"

RUN apt-get update && apt-get install -y default-jre
RUN apt-get install unzip
COPY requirements.txt ./
COPY import_language_tool_python.py ./
COPY chunk_1.txt ./
COPY ${FUNCTION_DIR}/languagetool /languagetool
RUN unzip /languagetool/LanguageTool-5.7.zip -d /languagetool

RUN pip install --no-cache-dir -r requirements.txt

CMD [ "sh", "-c", "ls /languagetool && python import_language_tool_python.py" ]
