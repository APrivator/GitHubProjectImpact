## Plot exploration graphs
# by Gui Lin
# Date: 2018-04

source("src/0.lib-setup.R")
# Plot Exploration ######
set.seed(379)
data <- downSample(x=trainingSet %>% select(-Class),y=trainingSet$Class)%>% sample_n(floor(nrow(.)*0.2))
data <- data %>% mutate(hasReadme=ifelse(hasReadme==FALSE,"noReadme","hasReadme")) %>% mutate(isfork=ifelse(isfork==0,"notFork","Fork")) %>% mutate(copyright=ifelse(copyright>=1,"hasCopyRightInfo","noCopyRightInfo")) %>% mutate(contact=ifelse(contact>=1,"hasContact","noContact"))%>% mutate(wiki=ifelse(wiki>=1,"hasWiki","noWiki"))
pdf(file="output/20180420_plot_explore.pdf",width = 10,height = 5)
ggplot(data,aes(x=log10(issues+1),y=contributors,shape=Class,color=Class))+  facet_grid(hasReadme~lang) +geom_point(position=position_jitter(h=0.05,w=0.05)) #->p
#p + stat_ellipse(type = "norm")
ggplot(data,aes(x=log10(commits+1),y=log10(releases+1),shape=Class,color=Class))+  facet_grid(hasReadme~lang) + geom_point(position=position_jitter(h=0.05,w=0.05)) #->p
ggplot(data,aes(x=log10(url_num+1),y=log10(rsize+1),shape=Class,color=Class))+  facet_grid(isfork~lang) + geom_point(position=position_jitter(h=0.05,w=0.05)) #->p
ggplot(data,aes(x=yr_creation,y=yr_active,shape=Class,color=Class))+  facet_grid(copyright~lang) + scale_x_continuous(breaks=seq(1,10,2))+ geom_point(position=position_jitter(h=0.05,w=0.05)) #->p
ggplot(data,aes(x=log10(releases+1),y=branches,shape=Class,color=Class))+  facet_grid(contact~lang) + geom_point(position=position_jitter(h=0.05,w=0.05)) #->p
dev.off()
