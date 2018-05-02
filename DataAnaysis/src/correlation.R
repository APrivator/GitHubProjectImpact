source("src/0.lib-setup.R")
load("output/model_inputs_v2_g_201804.RData")

f.age.rename <- function(data){
  data %>% mutate(yr_creation=age) %>% select(-age)
}
data_corr <- data_train_cut_bl %>%  mutate(hasReadme=as.factor(is.na(url_num))) %>% f.age.rename



predictors <- c("branches","releases","issues","commits","size",  "isfork", "avg_following", "contributors","url_num","wiki","command","contact","copyright","rsize","yr_active","avg_followers","yr_creation")
predictors <- predictors[order(predictors)]
predictors <- c(predictors,"imp")

pdf("data/20180425_plot_corr_3in1.pdf",width = 10,height = 5)
par(mfrow = c(1, 3))
data_corr%>%
    select(one_of(predictors)) %>%
  #mutate(parent=ifelse(parent=="-1",0,1)) %>%
    cor(use = "na.or.complete",method="pearson") %>%
    corrplot(method="shade",shade.col=NA, tl.col="black", tl.srt=45, title = "Pearson Correlation", mar = c(0,0,1,0))


data_corr%>%
    select(one_of(predictors)) %>%
  #mutate(parent=ifelse(parent=="-1",0,1)) %>%
    cor(use = "na.or.complete",method="spearman") %>%
    corrplot(method="shade",shade.col=NA, tl.col="black", tl.srt=45, title = "Spearman Correlation", mar = c(0,0,1,0))

data_corr %>%
    sample_n(1000)  %>%
    select(one_of(predictors)) %>%
  #mutate(parent=ifelse(parent=="-1",0,1)) %>%
    cor(use = "na.or.complete",method="kendall") %>%
    corrplot(method="shade",shade.col=NA, tl.col="black", tl.srt=45, title = "Kendall correlation", mar = c(0,0,1,0))

dev.off()
