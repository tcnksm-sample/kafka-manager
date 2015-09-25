FROM java:8

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
                              git \
                              curl \
                              ca-certificates \
                              apt-transport-https \
            && rm -rf /var/lib/apt/lists/*

# Install scala
ENV SCALA_VERSION 2.11.7
RUN curl -fsL http://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz \
        | tar xfz - -C /opt/

# Install sbt
ENV SBT_VERSION 0.13.7
RUN curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb \
    && dpkg -i sbt-$SBT_VERSION.deb && rm sbt-$SBT_VERSION.deb \
    && apt-get update \
    && apt-get install -y sbt
ENV PATH /opt/scala-${SCALA_VERSION}/bin/:${PATH}

# Install kafka-manager
ENV KM_VERSION 1.2.7
RUN git clone https://github.com/yahoo/kafka-manager /tmp/kafka-manager \
        && cd /tmp/kafka-manager \
        && git checkout $KM_VERSION \
        && sbt clean dist \
        && unzip -d / ./target/universal/kafka-manager-${KM_VERSION}.zip \
        && rm -fr /tmp/${KM_VERSION} /tmp/kafka-manager-${KM_VERSION} \
        && mv /kafka-manager-${KM_VERSION} /kafka-manager
        
WORKDIR /kafka-manager
ADD run.sh run.sh

CMD ["./run.sh"]




    
