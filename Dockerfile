FROM apache/zeppelin:0.11.2

USER root

RUN apt-get update && apt-get install -y curl tar && rm -rf /var/lib/apt/lists/* \
 && curl -fSL https://archive.apache.org/dist/spark/spark-3.5.1/spark-3.5.1-bin-hadoop3.tgz -o /tmp/spark.tgz \
 && tar -xzf /tmp/spark.tgz -C /opt \
 && ln -s /opt/spark-3.5.1-bin-hadoop3 /opt/spark \
 && rm /tmp/spark.tgz

ENV SPARK_HOME=/opt/spark
ENV PATH=/opt/spark/bin:$PATH

USER 1000
