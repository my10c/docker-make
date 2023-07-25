# -- define the image to use -- #
FROM ubuntu:22.04

# -- setup global profiles file -- #
WORKDIR /etc
RUN echo 'UTC' > timezone
RUN echo 'docker' > hostname

# profiles for bash and zsh
#COPY profile/profile profile
#COPY profile/zshrc zsh/zshrc
#COPY profile/zshenv zsh/zshenv

# -- install package -- #
# -- ca-certificates is required for send-to-slack and any other that does a https requuest
RUN apt -y update
RUN apt -y install zsh file htop ca-certificates

# -- the send-to-slack binary and config -- #
WORKDIR /
RUN mkdir -p /usr/local/sbin /usr/local/etc/send-to-slack
COPY etc/config.ini /usr/local/etc/send-to-slack
COPY sbin/send-to-slack /usr/local/sbin
RUN chmod 0400 /usr/local/etc/send-to-slack/config.ini
RUN chmod 0755 /usr/local/sbin/send-to-slack

# -- copy the loop script -- #
COPY loop /
RUN chmod 0755 /loop

# Go into  loop
CMD [ "/loop" ]
