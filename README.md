# Influenza Vaccination Coverage in the United States

This project looks at influenza vaccination coverage in the United States among people aged 6 months and older. The report compares vaccination coverage in May across flu seasons and shows how coverage changes throughout each season from 2009–10 to 2024–25.

## Generate the report

To generate the report locally, it will need R and Pandoc. The required R packages are managed using `renv`, with their versions recorded in `renv.lock`.

First, install the required R packages:

``` bash
make install
```

Then generate the report:

``` bash
make
```

This will process the data, create the table and figure, and generate `report.html`.

To remove the generated files and rebuild the report from scratch, run:

``` bash
make clean
make
```

## Generate the report using Docker

Docker can also be used to generate the report without installing R or the required R packages on the computer.

### Build the Docker image

To build the Docker image locally, run:

``` bash
docker build --platform linux/amd64 -t flu-vaccination-report .
```

### DockerHub image

The Docker image is also available on DockerHub:

<https://hub.docker.com/r/jitongj/flu-vaccination-report>

### Run the report using Docker

To generate the report using the DockerHub image, run:

``` bash
make docker
```

This will run the analysis inside a Docker container and save the final HTML report to `report/report.html` on the computer.

## Project structure

- `data/` contains the original CDC influenza vaccination dataset.
- `code/preprocess_data.R` prepares the data for analysis.
- `code/generate_table.R` creates the May vaccination coverage table.
- `code/generate_figure.R` creates the monthly vaccination coverage figure.
- `output/` stores the intermediate files generated during the analysis.
- `report.Rmd` contains the report text, table, and figure.
- `Makefile` contains the commands for generating the report.
- `Dockerfile` contains the instructions for building the Docker image.
- `renv.lock` records the R package versions used in the project.
- `renv/` contains the files needed to manage the R environment.
