## For plotting the tree graph from C50 model
# by Gui Lin
# Date: 2018-04

source("src/lib-setup.R")
require("C50")
require("partykit")

# load data
load("output/20180425_mod_c50_11.RDS")

# uncomment if you want to retrain
# set.seed(291)
# trainingSet_smaller_2 <-
#   rbind(trainingSet %>% filter(Class=="nonEvent")  %>% sample_n(floor(1.0*nrow(.))) %>% rbind(trainingSet %>% filter(Class=="event"))) %>%
# 	#upSample(x=trainingSet%>%select(-Class),y=trainingSet$Class) %>%
# 	#trainingSet %>%
#   mutate(url_num=ifelse(url_num>0,1,0)) %>%
#   mutate(wiki=ifelse(wiki>0,1,0))%>%
#   mutate(command=ifelse(command>0,1,0)) %>%
#   mutate(contact=ifelse(contact>0,1,0)) %>%
#   mutate(copyright=ifelse(copyright>0,1,0)) %>%
#   mutate(hasReadme=ifelse(hasReadme>0,1,0)) %>%
# 	filter(yr_active>=0)
#
# data_two_class_test_2 <- data_two_class_test %>%
#   mutate(url_num=ifelse(url_num>0,1,0)) %>%
#   mutate(wiki=ifelse(wiki>0,1,0))%>%
#   mutate(command=ifelse(command>0,1,0)) %>%
#   mutate(contact=ifelse(contact>0,1,0)) %>%
#   mutate(copyright=ifelse(copyright>0,1,0)) %>%
#   mutate(hasReadme=ifelse(hasReadme>0,1,0))
# set.seed(980)
# mod_c50_11 <- C5.0(x = trainingSet_smaller_2%>%select(-Class,-parent,-lang),
#      y = trainingSet_smaller_2$Class,
#      trials = 50,
#      rules=FALSE,
# 		 control = C5.0Control(
# 			 minCases = 100
# 			 ),
# 		 )



# for plotting the tree
pdf(file="output/20180425_mod_c50_11.pdf", width=100/2.54, height=60/2.54)
# plot the whole tree
plot(mod_c50_11)
dev.off()

