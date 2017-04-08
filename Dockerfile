# Builds a Docker image for OpenFOAM and Calculix in a Desktop 
# environment with Ubuntu and LXDE.
#
# The built image can be found at:
#   https://hub.docker.com/r/unifem/openfoam-cxx
#
# Authors:
# Xiangmin Jiao <xmjiao@gmail.com>

FROM unifem/desktop-base:latest
LABEL maintainer "Xiangmin Jiao <xmjiao@gmail.com>"

USER root
WORKDIR /tmp

# Install OpenFOAM, Calculix, along with FreeCAD and Gmsh
RUN add-apt-repository http://dl.openfoam.org/ubuntu && \
    sh -c "curl -s http://dl.openfoam.org/gpg.key | apt-key add -" && \
    add-apt-repository ppa:freecad-maintainers/freecad-stable && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        openfoam4 \
	freecad \
        calculix-ccx \
        gmsh && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR $DOCKER_HOME

USER root
