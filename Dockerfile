# Define function directory
ARG FUNCTION_DIR="."

FROM python:3.9
#RUN git clone --branch PT-JRE https://github.schneider-electric.com/EIA/dcr-ai-flagship.git .
#ENV LTP_PATH "/app/cache/language_tool_python"
# set the root path for language tool
ENV LTP_PATH "${FUNCTION_DIR}/languagetool"

RUN apt-get update && apt-get install -y default-jre
RUN apt-get install unzip
COPY requirements.txt ./
COPY import_language_tool_python.py ./
COPY chunk_1.txt ./

# RUN mkdir -p /app/cache/language_tool_python
# COPY ./languagetool/LanguageTool-5.7.zip ./languagetool/LanguageTool-5.7.zip
# RUN unzip ./languagetool/LanguageTool-5.7.zip -d app/cache/language_tool_python

# Copy language tool and unzip it
COPY ${FUNCTION_DIR}/languagetool /languagetool
RUN unzip /languagetool/LanguageTool-5.7.zip -d /languagetool

RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "import_language_tool_python.py" ]