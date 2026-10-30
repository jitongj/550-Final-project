# Influenza Vaccination Coverage in the United States

This project contains a reproducible report examining national influenza vaccination coverage among people aged 6 months and older. The report summarizes May coverage by flu season and visualizes how coverage changes from month to month across the 2009–10 through 2024–25 seasons.

## Generate the report

The project requires R with the `rmarkdown`, `knitr`, `dplyr`, `ggplot2`, and `gt` packages, plus Pandoc. From the project root, run:

```bash
make
```

This command preprocesses the source data, generates the table and figure, and renders `report.html`. To remove all generated files and rebuild from a clean state, run:

```bash
make clean
make
```

## Project structure

- `data/` contains the original CDC influenza vaccination CSV.
- `code/preprocess_data.R` filters and prepares the analysis data.
- `code/generate_table.R` generates Table 1, the formatted May coverage table.
- `code/generate_figure.R` generates Figure 1, the monthly coverage plot.
- `output/` contains intermediate and generated analysis files created by `make`.
- `report.Rmd` contains the report narrative and assembles the generated table and figure.
- `Makefile` defines the complete reproducible workflow.
