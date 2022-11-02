FROM carla-prerequisites:latest

ARG GIT_BRANCH=master
ARG GIT_REPO=https://github.com/carla-simulator/carla.git

USER ue4

RUN cd /home/ue4 && \
  git clone --depth 1 --branch $GIT_BRANCH "$GIT_REPO" && \
  cd /home/ue4/carla && \
  ./Update.sh && \
  make CarlaUE4Editor && \
  make PythonAPI && \
  make build.utils && \
  make package && \
  rm -r /home/ue4/carla/Dist

WORKDIR /home/ue4/carla
