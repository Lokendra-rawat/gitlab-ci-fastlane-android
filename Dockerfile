FROM jangrewe/gitlab-ci-android

RUN apt-get -qq update && \
    apt-get install -qqy --no-install-recommends \
      build-essential \
      ruby-full

RUN gem update --system     
RUN gem install bundler fastlane --no-rdoc --no-ri


# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get install --yes nodejs
RUN node -v
RUN npm -v
RUN npm i -g yarn
# Cleanup
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y
