ARG IRIS_IMAGE
ARG IRIS_TAG
FROM ${IRIS_IMAGE}:${IRIS_TAG}

COPY --chown="${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP}" . /opt/irisbuild
RUN pip install --no-warn-script-location -r /opt/irisbuild/requirements_iris.txt

RUN iris start IRIS \
    && iris session IRIS < /opt/irisbuild/iris.script \
    && iris stop IRIS quietly

RUN --mount=type=secret,id=iris_pw,mode=0444 /usr/irissys/dev/Container/changePassword.sh /run/secrets/iris_pw
RUN rm -r /opt/irisbuild/*