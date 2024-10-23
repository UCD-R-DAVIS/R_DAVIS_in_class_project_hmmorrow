#other data types
c(4,6,"dog")
list(4,6,"dog")
a=list(4,6,"dog")
class(a)
#data.frames
letters
data.frame(letters)
df=data.frame(letters)
length(df)
dim(df)
nrow(df)
ncol(df)
?dim
#matrices and arrays are in video
#factors
animals=factor(c("duck","duck","goose","goose"))
animals
animals=factor(x=animals,levels=c("goose","pigs","duck"))
animals
year=factor(c(1978,1980,1034,1979))
year
as.numeric
rm(factor(1034))
rm[factor(1034)]
factor[c(1022)]
