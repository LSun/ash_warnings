setwd("~/Dropbox/Projects/ash_warnings/plots")

f<-list.files("~/Dropbox/Projects/ash_warnings/data",full.names=TRUE)
g<-list.files("~/Dropbox/Projects/ash_warnings/data")
n<-length(f)

for (i in 1:n) {
	png(sub("^([^.]*).*", "\\1", g[i]))
	plot(density(scan(f[i])),main=sub("^([^.]*).*", "\\1", g[i]))
	dev.off()
}