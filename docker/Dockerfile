# from https://github.com/flmu/mlflow-tracking-server
FROM ubuntu:18.02
FROM python:3.9



RUN apt-get update -y

RUN apt-get install --no-install-recommends -y -q ca-certificates python-dev python-setuptools \
                                                  wget unzip git

RUN apt install python3 -y
RUN apt install python3-pip -y
RUN python3 -m pip install --upgrade pip 

RUN pip3 install --upgrade pip && \
    pip3 install mlflow --upgrade 

RUN wget -nv https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.zip && \
    unzip -qq google-cloud-sdk.zip -d /tools && \
    rm google-cloud-sdk.zip && \
    /tools/google-cloud-sdk/install.sh --usage-reporting=false \
        --path-update=false --bash-completion=false \
        --disable-installation-options && \
    /tools/google-cloud-sdk/bin/gcloud -q components update \
        gcloud core gsutil && \
    /tools/google-cloud-sdk/bin/gcloud config set component_manager/disable_update_check true && \
    touch /tools/google-cloud-sdk/lib/third_party/google.py

ENV PORT 5000
ENV GCS_BUCKET bucket
# ENV AWS_ACCESS_KEY_ID aws_id
# ENV AWS_SECRET_ACCESS_KEY aws_key

ENV FILE_DIR /tmp/mlflow

RUN mkdir -p /opt/mlflow

COPY run.sh /opt/mlflow
RUN chmod -R 777 /opt/mlflow/

ENTRYPOINT ["/opt/mlflow/run.sh"]