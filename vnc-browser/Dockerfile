FROM ubuntu:latest
RUN apt-get update

RUN apt-get install -y x11vnc xvfb firefox
RUN mkdir ~/.vnc
# Setup a password
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
# Autostart firefox (might not be the best way to do it, but it does the trick)
RUN bash -c 'echo "firefox" >> /root/.bashrc'

# Install tampermonkey
COPY ./*.xpi /usr/lib/firefox/distribution/extensions/

EXPOSE 5900
CMD ["x11vnc", "-forever", "-usepw","-create"]
