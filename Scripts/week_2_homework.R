set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2
rm(animals,weight)
rm(NA)
remove=NA
hw2%in%remove
hw2[!hw2%in%remove]
hw2%in%[>=14,<=38]
hw2[hw2>=14|hw2<=38]
hw2=   hw2[!hw2%in%remove]
hw2=hw2[hw2>=14|hw2<=38]
hw2
hw2=hw2[hw2>=14&hw2<=38]
hw2
prob1=hw2
times3=(prob1)*3
plus10=(times3)+10
plus10[c(TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE)]
final=plus10[c(TRUE,FALSE)]
final
