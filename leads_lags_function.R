#Name: leads_lags_function.R
#Function call: leads_lags
#Parameters: dataset1 - dataset from input port
#            colset - selected columns
#            leads - # of leads desired
#            lags - # of lags desired
#Description: leads_lags function combines the original dataset with the leads and lags of desired inputs from that dataset
#Created By: Casey Whorton



leads_lags<-function(dataset1,colset,leads,lags,TimeIndex=FALSE)
{
  t_index<-data.frame((-(leads)+1):(dim(dataset1)[1]+lags))
  print(t_index)
  names(t_index)<-'TimeIndex'
  colset<-ts(dataset1[colset])
  dataset1<-ts(dataset1)
  datanames<-colnames(dataset1)
  colsetnames<-colnames(colset)
  ileads_set<-ts()
  ilags_set<-ts()
  
  if(leads >0 || lags >0)
  {
    if (leads>0)
    {
      lead_name_list<-array()
      for (i in 1:leads)
      {
        leads_set<-lag(colset,i)
        lead_name<-paste("lead",abs(i),sep="")
        new_colnames<-paste(colsetnames,lead_name,sep="_")
        lead_name_list<-c(lead_name_list,new_colnames)
        ileads_set<-ts.union(ileads_set,leads_set)
      }
      lead_name_list<-lead_name_list[2:length(lead_name_list)]
    }
    
    if (lags>0)
    {
      lag_name_list<-array()
      for (i in 1:lags)
      {
        lags_set<-lag(colset,-i)
        lag_name<-paste("lag",abs(-i),sep="")
        new_colnames<-paste(colsetnames,lag_name,sep="_")
        lag_name_list<-c(lag_name_list,new_colnames)
        ilags_set<-ts.union(ilags_set,lags_set)
      }
      lag_name_list<-lag_name_list[2:length(lag_name_list)]
    }
    
    if (leads>0 && lags>0)
    {
      full_dataset<-ts.union(dataset1,ileads_set[,c(2:dim(ileads_set)[2])],ilags_set[,c(2:dim(ilags_set)[2])])
      colnames(full_dataset)<-c(datanames,lead_name_list,lag_name_list)
    }
    
    if (leads>0 && lags==0)
    {
      full_dataset<-ts.union(dataset1,ileads_set[,c(2:dim(ileads_set)[2])])
      colnames(full_dataset)<-c(datanames,lead_name_list)
    }
    
    if (leads==0 && lags>0)
    {
      full_dataset<-ts.union(dataset1,ilags_set[,c(2:dim(ilags_set)[2])])
      colnames(full_dataset)<-c(datanames,lag_name_list)
    }
    full_dataset<-data.frame(full_dataset)
    if (TimeIndex)
    {
    full_dataset<-cbind(t_index,full_dataset)
    }
    return(full_dataset)
  }
  if (TimeIndex)
  {
    dataset1<-cbind(t_index,data.frame(dataset1))
    return(dataset1)
  }
  return(data.frame(dataset1))
}



