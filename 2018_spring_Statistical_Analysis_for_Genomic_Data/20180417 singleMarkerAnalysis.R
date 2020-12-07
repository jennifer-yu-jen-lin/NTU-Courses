y = scan() # data input # space # enter
30 32 28 29 29 22 20 21 20 21 

y 




x = matrix(scan(),10,2) # 10 rows , 2 columns
1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 0 0 0 0 0


x = matrix(scan(),10,2, byrow=TRUE) # 10 rows , 2 columns
1 1
1 1
1 1
1 1
1 1
1 0
1 0
1 0
1 0
1 0

trt = gl(2,5,10) # generate level 兩變及？重複5次
# t-test
var.test(y~trt) # 先 test VAR 是否相同
t.test(y~trt, var.equal=TRUE) # equal variance t.test # 預設值是var.equal=FALSE

# linear algebra to estimate the genetic coefficient
'''
t(x) # transpose
t(x) %*% x
t(x) * 2 
solve( t(x) %*% x) # inverse = FUN solve #解二元一次方程
'''
b = solve( t(x) %*% x) %*% (t(x) %*% y)
sigma2 = t(y-x%*%b) %*% (y-x%*%b)/10


y = c(28, 32, 28, 29, 31, 20, 18, 21, 20, 21) # data input # space # enter
x = matrix(c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0),10,2) # 10 rows , 2 columns
trt = gl(2,5,10) # gl = Generate Factor Levels,  2 levels, 5 replications




# F-test
out = lm(y~trt) # linear model
anova(out) # 列出變方分析表



