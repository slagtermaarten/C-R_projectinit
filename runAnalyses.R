mainprg <- 'main'
tmpfile <- 'tmpfile'

callSimulation <- function() 
{ 
    cmd <- paste(mainprg, ">", tmpfile) 
    system(cmd)
    read.table(tmpfile)
}
