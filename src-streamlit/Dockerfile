FROM python:3.12-slim

RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY ./StreamlitApp/* /opt/StreamlitApp/

RUN pip install --root-user-action 'ignore' -r /opt/StreamlitApp/requirements.txt
RUN pip install --root-user-action 'ignore' /opt/StreamlitApp/intersystems_irispython-3.2.0-py3-none-any.whl
RUN rm /opt/StreamlitApp/intersystems_irispython-3.2.0-py3-none-any.whl

EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

WORKDIR /opt/StreamlitApp
ENTRYPOINT [ "streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0" ]