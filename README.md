
<a href="https://www.unamur.be/en"><img src="Child/figures/UNamur.png" alt="Unamur logo" align="right" style="width:10%" /></a>


# Thesis

**Project:** This repository contains the project of my master's thesis submitted in fulfillment of the requirements for the Master’s Degree in Business Management and Administration, Finance Specialization at the University of Namur, Belgium.

> Towards Green Companies: A Panel Data Study of The Environmental and Financial Performance Nexus

**Academic year:** 2017-2018

**Author** : Pierrick KINIF

The repository is organized following the methodology of Gandrud, Christopher. 2013. Reproducible Research with R and R Studio. New York: Chapman and Hall/CRC. 

Each section of this thesis corresponds to an R Markdown file in the `Child` folder. The `Child/ThesisSkeleton.Rmd` file is the parent document which merges all the child directories into a consolidated pdf document `ThesisSkeleton.pdf`. The `Child/Analysis` sub-folder contains a list of makefiles whose outputs are saved into `Child/Analysis/DataBase`. The final database states in the folder `Thesis/Child/Analysis/DataBase/DataSynchronization/`:

- `NoOutliersLag0`: contains the complete database (i.e. Financial and Environemental data) when no lag and no outliers
- `NoOutliersLag1`: contains the complete database when lag = 1 and no outliers
- `NoOutliersLag2`: contains the complete database when lag = 2 and no outliers
- `FinancialData_1216.csv`: contains the financial database from 2012 to 2016
- `Lag0.csv`: contains the complete database when lag = 0 and outliers are kept
- `Lag1.csv`: contains the complete database when lag = 1 and outliers are kept
- `Lag2.csv`: contains the complete database when lag = 2 and outliers are kept

