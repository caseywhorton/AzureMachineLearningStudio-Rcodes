# AzureMachineLearningStudio-Rcodes README

## Contents

* **Linear Hypothesis Test**
  - "Makes performing a linear hypothesis test on any subset of predictors/exogenous variables in a multiple linear regression model easy using a dialog box and minimal effort from the end-user."
  - "Microsoft's Azure Machine Learning Studio is a data science platform and tool with a graphical user interface that lets data scientists create data science solutions."
  - "R is an open-source statistical programming language."

* **Overview**
  - "Using any multiple linear regression model, performs a linear hypothesis test on any subset of explanatory/exogenous variables.  Utilizes the 'Custom R Script' node in Microsoft Azure Machine Learning Studio, which suipplies as dialog box to help the end-user."
  - "Useful for exploring the relationship between a single target variable and many individual or subsets of explanatory variables."
  - "Useful if the number of explanatory variables is very large, and a dialog box for keeping track of included variables is helpful."
  - "Not useful is needing a dataframe or matrix output, this project produces a table of values that informs the data scientist about what variables to include in the pipeline, preferably separate from a node with this script."

* **Example**
  - Output Example:
    - https://caseywhorton.files.wordpress.com/2017/05/output2.png?w=616

* **Getting Started**
  - Installation
    - "You will need to install the R shell, which is responsible for compiling and running the R script."
      - R shell: https://www.r-project.org/
    - "R-studio is a convenient way to edit and view your R scripts."
      - R-studio: https://www.rstudio.com/
    - "You will need to have a Microsoft account or create an account.  As of 2017, there is a free tier that allows you experiment and practice with this tool."
      - Microsoft Azure Machine Learning Studio: https://studio.azureml.net
    - "For more background on the linear hypothesis test and a look at the output can be found here:"
      - Blog Post On Subject: https://caseywhorton.wordpress.com/2017/05/17/linear-hypothesis-test-custom-r-module-code-and-thoughts/

* **Leads and Lags Generator**
  - "Generate leads and lags for time series variables in a dataframe and recombine into that same dataframe for a full set of variables with whatever number of leads and lags the end-user wants."
  - "Microsoft's Azure Machine Learning Studio is a data science platform and tool with a graphical user interface that lets data scientists create data science solutions."
  - "R is an open-source statistical programming language."

* **Overview**
  - "When using time series data in a machine learning algorithm or data science project, sometimes you want or need features with leads or lags.  Using a custom R script within Microsoft Azure Machine Learning, you can select how many leads or lags you want added to the current dataframe and from which original features, and you get all of those features binded together in a dataframe returned to you.
  - "Useful when dealing with continuous, time series data."
  - "Not useful when you do not need leads and/or lags."

* **Example**
  - https://caseywhorton.files.wordpress.com/2017/05/overall.png

* **Getting Started**
  - Installation
    - "You will need to install the R shell, which is responsible for compiling and running the R script."
      - R shell: https://www.r-project.org/
    - "R-studio is a convenient way to edit and view your R scripts."
      - R-studio: https://www.rstudio.com/
    - "You will need to have a Microsoft account or create an account.  As of 2017, there is a free tier that allows you experiment and practice with this tool."
      - Microsoft Azure Machine Learning Studio: https://studio.azureml.net
    - "More background on the lead and lags generator R custom model and a look at the output can be found here:"
      - https://caseywhorton.wordpress.com/2017/05/06/generating-leads-and-lags-custom-r-module-in-azure-machine-learning-studio/
    
## Supporting Documentation

* **README Formatting Style Guide**
- https://github.com/infochimps-labs/style_guide/edit/master/style-guide-for-readme-files.md
