library(ashr)

sink(file('./null_standard_normal_simulation.log', open = 'wt'), type = 'message')
options(warn=1)

t<-c()

N<-200



for (i in 1:N) {
	beta1<-rnorm(1000,0,1)
	beta2<-rnorm(1000,0,1)
	s<-rep(1,1000)
	betahat1<-rnorm(1000,beta1,s)
	betahat2<-rnorm(1000,beta2,s)
	
	r12<-ash(c(betahat1,betahat2),c(s,s),mixcompdist="normal",method="shrink")
	r1<-ash(betahat1,s,mixcompdist="normal",method="shrink")
	r2<-ash(betahat2,s,mixcompdist="normal",method="shrink")
	
	t<-c(t,2*(r1$loglik+r2$loglik-r12$loglik))
   tryCatch(
   {
       r12<-ash(c(betahat1,betahat2),c(s,s),mixcompdist="normal",method="shrink")
   }, warning = function(w) {
	message(paste('ash12-',i,'\n'))
       message(paste('betahat1 is', betahat1, '\n'))
       message(paste('betahat2 is', betahat2, '\n'))
       message(paste('message is', w, '\n'))
   }, error = function(e) {
	message('Error here')
}
   )
   tryCatch(
   {
	r1<-ash(betahat1,s,mixcompdist="normal",method="shrink")
   }, warning = function(w) {
	message(paste('ash1-',i,'\n'))
       message(paste('betahat1 is', betahat1, '\n'))
       message(paste('message is', w, '\n'))
   }, error = function(e) {
	message('Error here')
}
   )
   tryCatch(
   {
	r2<-ash(betahat2,s,mixcompdist="normal",method="shrink")
   }, warning = function(w) {
	message(paste('ash2-',i,'\n'))
       message(paste('betahat2 is', betahat2, '\n'))
       message(paste('message is', w, '\n'))
   }, error = function(e) {
	message('Error here')
}
   )
}