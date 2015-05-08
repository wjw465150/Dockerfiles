#
# chrome Dockerfile
#
# 

# Pull base image. 

#usage: docker run -it --rm -p 5901:5901 -e USER=root wjw465150/chrome bash -c "vncserver :1 -geometry 1440x900 -depth 24

FROM lalyos/ubuntu-desktop

MAINTAINER wjw465150 <wjw465150@gmail.com>

# Install Chromium.
RUN \
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update && \
  apt-get install -y google-chrome-stable && \
  rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]

# Expose ports.
EXPOSE 5901
