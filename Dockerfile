FROM rocker/tidyverse:4.4.3

RUN apt-get update && apt-get install -y --no-install-recommends \
    make \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /project

COPY renv.lock ./
COPY .Rprofile ./
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN Rscript -e 'renv::restore(prompt = FALSE)'

COPY Makefile report.Rmd ./
COPY code/ code/
COPY data/ data/

RUN mkdir -p output report

CMD ["sh", "-c", "make report.html && cp report.html report/"]
