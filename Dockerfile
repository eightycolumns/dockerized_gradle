FROM openjdk:8

RUN curl -LO https://services.gradle.org/distributions/gradle-4.0-bin.zip && \
    unzip gradle-4.0-bin.zip && \
    rm gradle-4.0-bin.zip && \
    mv gradle-4.0 /opt

ENV PATH "/opt/gradle-4.0/bin:${PATH}"

RUN useradd -m gradle && \
    mkdir -p /home/gradle/.gradle && \
    chown gradle:gradle /home/gradle/.gradle

VOLUME /home/gradle/.gradle

USER gradle

ENTRYPOINT ["gradle", "--no-daemon"]
