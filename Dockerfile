FROM ruby:3.3.4-alpine

RUN apk update && apk add --no-cache \
  build-base \
  nodejs \
  postgresql-dev \
  nginx \
  git \
  bash \
  tini \
  nano \
  tzdata \
  yarn

ENV TZ=America/Denver
ENV RAILS_ENV=production

RUN cp /usr/share/zoneinfo/$TZ /etc/localtime
RUN echo $TZ > /etc/timezone

WORKDIR /var/www/johnson

COPY Gemfile Gemfile.lock ./
RUN bundle install

RUN rails assets:precompile

COPY nginx.conf /etc/nginx/http.d/default.conf

COPY . .

EXPOSE 3000
EXPOSE 80

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["sh", "-c", "rails server -b 0.0.0.0 -p 3001 & nginx -g 'daemon off;'"]
