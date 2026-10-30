report.html: report.Rmd output/flu_data.rds output/national_overall.rds \
	output/season_table.rds output/coverage_over_time.png
	Rscript -e 'rmarkdown::render("report.Rmd", output_file = "report.html", quiet = TRUE)'

output/flu_data.rds: code/preprocess_data.R data/Influenza_Vaccination_Coverage_for_All_Ages_(6+_Months).csv
	Rscript code/preprocess_data.R

output/national_overall.rds: code/preprocess_data.R data/Influenza_Vaccination_Coverage_for_All_Ages_(6+_Months).csv
	Rscript code/preprocess_data.R

output/season_table.rds: code/generate_table.R output/national_overall.rds
	Rscript code/generate_table.R

output/coverage_over_time.png: code/generate_figure.R output/national_overall.rds
	Rscript code/generate_figure.R

.PHONY: clean

clean:
	rm -f output/*.rds output/*.png report.html
