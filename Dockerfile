FROM trestletech/plumber

# copy necessary files
RUN mkdir /data
COPY car_price.rds /data/car_price.rds
COPY deploy_noYAML.R /data/plumber.R
WORKDIR /data

# plumber instructions to run
EXPOSE 8000
ENTRYPOINT ["R", "-e", \
    "pr <- plumber::plumb('/data/plumber.R'); \
    pr$run(host='0.0.0.0', port=8000)"]
