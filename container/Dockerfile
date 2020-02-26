FROM ruby:latest
WORKDIR /srv/presentation
COPY Gemfile ./
RUN gem install bundler && \
  git clone -b 3.9.2 --depth 1 https://github.com/hakimel/reveal.js.git && \
  bundle --path=.bundle/gems --binstubs=.bundle/bin
CMD ln -s /srv/presentation/reveal.js /slides/reveal.js && \
  bundle exec asciidoctor-revealjs /slides/${ADOC_FILE} && \
  ruby -run -e httpd /slides -p 2342

