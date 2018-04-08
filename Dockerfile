FROM alpine

ENV GOPATH /go
ENV PATH ${GOPATH}/bin:/usr/local/go/bin:$PATH

RUN apk add --no-cache --update bash

COPY terraform /usr/local/bin/terraform
COPY jq /usr/local/bin/jq
COPY fly /usr/local/bin/fly
COPY bosh /usr/local/bin/bosh
COPY yaml /usr/local/bin/yaml
COPY yaml /usr/local/bin/yq
COPY certstrap /usr/local/bin/certstrap
COPY prep_binaries.sh .
RUN ./prep_binaries.sh

COPY go.tar.gz .
RUN tar -C /usr/local -xzf go.tar.gz \
    && rm go.tar.gz \
    && mkdir -p "${GOPATH}/src" "${GOPATH}/bin" && chmod -R 777 "${GOPATH}"

RUN apk add --update \
    python-dev

COPY awscli-bundle.zip .
RUN unzip awscli-bundle.zip \
    && rm awscli-bundle.zip \
    && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
    && rm -r awscli-bundle \
    && aws --version

RUN go get -d github.com/onsi/ginkgo \
 && cd ${GOPATH}/src/github.com/onsi/ginkgo \
 && git checkout v1.4.0 \
 && go install github.com/onsi/ginkgo/ginkgo \
 && rm -rf ${GOPATH}/src/* ${GOPATH}/pkg/*

RUN gem install --no-document --no-update-sources --verbose cf-uaac \
    && rm -rf /usr/lib/ruby/gems/2.3.0/cache/

RUN go get github.com/EngineerBetter/stopover
RUN go get github.com/krishicks/yaml-patch/cmd/yaml-patch
