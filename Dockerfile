FROM brooksp/gcc-arm-none-eabi-9
LABEL maintainer="Brooks Prumo <brooks@prumo.org>"

RUN apt-get update && apt-get install -q -y --no-install-recommends \
	curl \
	git \
	make \
	python3 \
	python3-pip \
	unzip

RUN python3 -m pip -q install -U pip \
	&& python3 -m pip -q install -U setuptools \
	&& python3 -m pip -q install -U nrfutil

ARG nrf5_SDK=nRF5_SDK_16.0.0_98a08e2
RUN curl -s https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v16.x.x/${nrf5_SDK}.zip -o ${nrf5_SDK}.zip \
	&& unzip -q ${nrf5_SDK}.zip \
	&& rm -f ${nrf5_SDK}.zip

WORKDIR /${nrf5_SDK}
