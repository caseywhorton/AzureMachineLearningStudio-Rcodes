# Name: Linear_Hypothesis_Test
# Date: 2/6/2017
# Created By: Casey Whorton
# Parameters:
# dataset1 dataframe "dataset imported into module, remaining parameters should be names of features in dataset1"
# target_var string "name of target variable for linear model"
# model_vars list "list of column names for unrestricted/full model
# test_vars list "list of feature names to test if coefficients are 0"
# dwbp bool "whether to include Durbin Watson and Breusch-Pagan tests"
# Purpose: this custom function will create a linear model for all the desired model_vars, then complete
# a linear hypothesis to test the hypothesis that all test_vars' coefficients = 0, the result is a table
# of the results with the desired outputs.  Also outputs the results of durbin watson test and breusch-pagan
# test for the original linear model

library(car)
library(sandwich)
library(lmtest)

Linear_Hypothesis_Test<-function(dataset1,target_var,model_vars,test_vars,dwbp=FALSE)
{
  dataset2<-data.frame(cbind(dataset1[target_var],dataset1[model_vars]))
  attach(dataset2)
  names(dataset2)[names(dataset2)==target_var]<-'target_var'
  dataset2<-ts(dataset2)
  linear_model<-lm(target_var~.,data=dataset2)
  linear_hyp_OLS<-linearHypothesis(linear_model,c(test_vars))
  OLS<-data.frame(c('OLS','OLS'))
  names(OLS)<-'OLS'
  HAC<-data.frame(c('HAC','HAC'))
  names(HAC)<-'HAC'
  linear_hyp_HAC<-linearHypothesis(linear_model,c(test_vars),vcov=vcovHAC(linear_model))
  headr<-data.frame(c('Target',target_var))
  names(headr)<-'Header'
  linear_hyp<-cbind(headr,OLS,linear_hyp_OLS,HAC,linear_hyp_HAC)
    if (dwbp)
    {
    dw<-dwtest(linear_model)
    print(dw)
    dw_df<-data.frame(cbind(c('Test Stat','p-value'),c(dw$statistic,dw$p.value)))
    colnames(dw_df)<-c('DW_Test','DW_Test')
    bp<-bptest(linear_model)
    print(bp)
    bp_df<-data.frame(cbind(c('Test-Stat','p-value'),c(bp$statistic,bp$p.value),c(bp$parameter,'-')))
    colnames(bp_df)<-c('BP_Test','BP_Test','BP_Df')
    headr<-data.frame(c('Target',target_var))
    names(headr)<-'Header'
    linear_hyp<-cbind(headr,dw_df,bp_df,OLS,linear_hyp_OLS,HAC,linear_hyp_HAC)
    }
  print('------------OLS-----------------')
  print(linear_hyp_OLS)
  print('------------HAC-----------------')
  print(linear_hyp_HAC)
  return(data.frame(linear_hyp))
}

