# HW7_3 Make Grade System using Module (testing file for python 3 !!!!!!!!)
# Lin, Yu-Jen
# NTU student ID: B04B01036

import grade_module

grade_module.set_max(3)

print(grade_module.add('Tom',0))
print(grade_module.add('Jerry',70))
print(grade_module.add('Sally',90))
print(grade_module.add('Jane',90))

grade_module.remove('Tom')
grade_module.add('Tom',50)

grade_module.output()

print(grade_module.watchlist())

print(grade_module.mean_and_max())

print(grade_module.find('Tom'))
print(grade_module.find('Jane'))

