FROM debian:bullseye-slim

ENV COMMANDLINE_ARGS=

#RUN adduser --system ai
#RUN addgroup --system ai

EXPOSE 7860

VOLUME [ "/data/models", "/data/embeddings" ]

RUN apt-get update && apt-get install -y --no-install-recommends wget git python3 python3-venv libgl1 libglib2.0-0 google-perftools

RUN git clone https://github.com/wjervis7/stable-diffusion-webui 
RUN cd stable-diffusion-webui
WORKDIR /stable-diffusion-webui
#RUN ls -la
#RUN pwd

RUN python3 -m venv venv

#COPY --chown=ai:ai webui.sh .
#COPY --chown=ai:ai webui-user.sh .

#RUN chmod 777 /stable-diffusion-webui
#RUN chown -R ai:ai /stable-diffusion-webui
#RUN chmod +x webui-user.sh

#USER ai:ai

ENTRYPOINT [ "./webui.sh", "--ckpt-dir=/data/models", "--embeddings-dir=/data/embeddings" ]

