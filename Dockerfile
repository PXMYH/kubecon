FROM alpine:3.7

RUN apk add --no-cache --update \
    bash \
    python-dev \
    ruby ruby-irb ruby-rake ruby-io-console ruby-bigdecimal ruby-json ruby-bundler \
    libressl libstdc++ tzdata ca-certificates \
    && apk add --virtual build-dependencies build-base ruby-dev libressl-dev \
    &&  echo 'gem: --no-document' > /etc/gemrc

COPY ["jq", "fly", "bosh", "yaml","certstrap","terraform","vault","consul","/usr/local/bin/"]
COPY yaml /usr/local/bin/yq
COPY prep_binaries.sh .
RUN ./prep_binaries.sh

ENV GOPATH /go
ENV PATH /go/bin:/usr/local/go/bin:$PATH
COPY go.tar.gz .
RUN tar -C /usr/local -xzf go.tar.gz \
    && rm go.tar.gz \
    && chmod -R 777 "/usr/local/go/bin" \
    && mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 $GOPATH

COPY awscli-bundle.zip .
RUN unzip awscli-bundle.zip \
    && rm awscli-bundle.zip \
    && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
    && rm -r awscli-bundle \
    && aws --version

RUN ["/bin/bash", "-c", "ls -al /usr/local/go/bin"] \
 && ["/bin/bash", "-c", "ls -al echo $PATH"] \
 && ["/bin/bash", "-c", "go get -d github.com/onsi/ginkgo"] \
 && cd ${GOPATH}/src/github.com/onsi/ginkgo \
 && git checkout v1.4.0 \
 && go install github.com/onsi/ginkgo/ginkgo \
 && rm -rf ${GOPATH}/src/* ${GOPATH}/pkg/*

RUN gem install --no-document --no-update-sources --verbose cf-uaac \
    && rm -rf /usr/lib/ruby/gems/2.4.0/cache/

RUN ["/bin/bash", "-c", "ls -al /usr/local/go/bin"] \
 && ["/bin/bash", "-c", "ls -al echo $PATH"] \
 && ["/bin/bash", "-c", "go get github.com/EngineerBetter/stopover"] \
 && ["/bin/bash", "-c", "go get github.com/krishicks/yaml-patch/cmd/yaml-patch"]
