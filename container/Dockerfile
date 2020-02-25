FROM ruby:latest
WORKDIR /srv/presentation
RUN gem install bundler
COPY Gemfile ./
RUN bundle --path=.bundle/gems --binstubs=.bundle/bin
CMD bundle exec asciidoctor-revealjs -a revealjsdir=https://cdn.jsdelivr.net/npm/reveal.js@3.9.2 /slides/${ADOC_FILE} && ruby -run -e httpd /slides -p 2342

