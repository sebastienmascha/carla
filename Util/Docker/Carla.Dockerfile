FROM carla-prerequisites:latest

ARG GIT_BRANCH

USER carla
WORKDIR /home/carla

COPY --chown=carla:carla . /home/carla/carla

RUN cd /home/carla/carla && ./Update.sh
RUN cd /home/carla/carla && make CarlaUE4Editor
RUN cd /home/carla/carla && make PythonAPI
RUN cd /home/carla/carla && make build.utils
RUN cd /home/carla/carla && make package
RUN rm -r /home/carla/carla/Dist

WORKDIR /home/carla/carla
