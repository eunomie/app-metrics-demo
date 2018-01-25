FROM ruby:2.5-alpine
WORKDIR /usr/src/app
COPY app-data .

RUN gem install --no-ri --no-rdoc sinatra faker

EXPOSE 4000
CMD ["ruby", "app.rb"]