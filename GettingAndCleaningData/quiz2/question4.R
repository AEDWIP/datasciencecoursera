
# How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page: 
#   
#   http://biostat.jhsph.edu/~jleek/contact.html 
# (Hint: the nchar() function in R may be helpful)

# see web scrapping lecture
con = url("http://biostat.jhsph.edu/~jleek/contact.html")
html = readLines(con)
close(con)

print(nchar(html[10]))
print(nchar(html[20]))
print(nchar(html[30]))
print(nchar(html[100]))