#!/usr/bin/env python
# coding: utf-8

# # Homework 14 - ML project
# ## Random Forest (RF) & Support Vector Machines (SVM)

# #### Lin, Yu-Jen 
# #### NTU student ID: b04b01036
# #### email: b04b01036@ntu.edu.tw
# 

# # 1. Load the data

# In[1]:


import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
get_ipython().run_line_magic('matplotlib', 'inline')
import seaborn as sns; sns.set()
from scipy import stats


# In[2]:


import sklearn
from sklearn import datasets
breast_cancer = datasets.load_breast_cancer()


# In[3]:


print(breast_cancer)


# In[5]:


breast_cancer.keys()


# In[6]:


print(breast_cancer.data.shape)


# In[7]:


n_samples, n_features = breast_cancer.data.shape
print((n_samples, n_features))
print(breast_cancer.data[0])


# In[8]:


print(breast_cancer.target.shape)
print(breast_cancer.target)


# In[9]:


print(breast_cancer.target_names)


# In[10]:


# quick view for breast_cancer datasets

# breast_cancer.data has 30 features
x_index = 0 # mean radius
y_index = 4 # mean smoothness

#   0   'mean radius', 'mean texture', 'mean perimeter', 'mean area', 'mean smoothness',
#   5   'mean compactness', 'mean concavity', 'mean concave points', 'mean symmetry', 'mean fractal dimension',
#  10   'radius error', 'texture error', 'perimeter error', 'area error', 'smoothness error',
#  15   'compactness error', 'concavity error', 'concave points error', 'symmetry error', 'fractal dimension error',
#  20   'worst radius', 'worst texture', 'worst perimeter', 'worst area', 'worst smoothness',
#  25   'worst compactness', 'worst concavity', 'worst concave points', 'worst symmetry', 'worst fractal dimension'

# this formatter will label the colorbar with the correct target names
formatter = plt.FuncFormatter(lambda i, *args: breast_cancer.target_names[int(i)])

plt.scatter(breast_cancer.data[:, x_index], breast_cancer.data[:, y_index],
            c=breast_cancer.target, cmap=plt.cm.get_cmap('tab20b_r', 2))    # 'tab20b_r' is color code of matplotlib
plt.colorbar(ticks=[0, 1], format=formatter)
plt.clim(-0.5, 2.5)
plt.xlabel(breast_cancer.feature_names[x_index])
plt.ylabel(breast_cancer.feature_names[y_index]);


# # 2. Split the datasets

# In[11]:


x = breast_cancer.data
y = breast_cancer.target

from sklearn.model_selection import train_test_split
# add random_state to fix the seed used by the random number generator
x_train, x_test, y_train, y_test = train_test_split(breast_cancer.data, breast_cancer.target,
                                                    test_size = 0.2, random_state=0) 


# # 3. Set estimators

# ## 3-1 Set estimator - RF
# RF: set your parameters (n_estimators, max_depth)

# In[43]:


from sklearn.ensemble import RandomForestClassifier
# add random_state to fix the seed used by the random number generator
RF = RandomForestClassifier(random_state=0, n_estimators=100, max_depth=10)


# ## 3-2 Set estimator - SVM
# SVM: use non-linear kernel

# In[49]:


from sklearn.svm import SVC  # "Support Vector Classifier"
SVM = SVC(kernel='rbf', probability=True) # non-linear: 'poly', 'rbf', 'sigmoid', 'precomputed' or a callable


# # 4. Training the model

# ## 4-1 Training the model - RF

# In[14]:


RF.fit(x_train, y_train)


# ## 4-2 Training the model - SVM

# In[ ]:


SVM.fit(x_train, y_train)


# # 5. Prediction

# ## 5-1 Prediction - RF

# In[24]:


y_pred_RF = RF.predict(x_test)
y_pred_RF


# ## 5-2 Prediction - SVM

# In[46]:


y_pred_SVM = SVM.predict(x_test)
y_pred_SVM


# # 6. Evaluate (cross-validation and confusion matrix)

# ### Correct

# In[26]:


print('RF:',"{0} / {1} correct".format(np.sum(y_test == y_pred_RF), len(y_test)))
print('SNM:',"{0} / {1} correct".format(np.sum(y_test == y_pred_SVM), len(y_test)))


# ### Accuracy score

# In[27]:


from sklearn.metrics import accuracy_score
print('Accuracy of  RF:' ,accuracy_score(y_test, y_pred_RF))
print('Accuracy of SVM:' ,accuracy_score(y_test, y_pred_SVM))


# ### Classification report

# In[28]:


from sklearn import metrics
Table_RF = metrics.classification_report(y_pred_RF, y_test)
Table_SVM = metrics.classification_report(y_pred_SVM, y_test)
print ('[Table_RF]\n', Table_RF, '\n\n\n\n\n[Table_SVM]\n', Table_SVM)


# ### Cross-validation

# In[42]:


from sklearn.model_selection import cross_val_score
scores_RF = cross_val_score(RF, x, y, cv=5)
scores_SVM = cross_val_score(SVM, x, y, cv=5)
print('cross_val_score_RF :', scores_RF)
print('cross_val_score_SVM:', scores_SVM)
# The mean score and the 95% confidence interval of the score estimate are hence given by:
print("\n RF 95 confidence interval: %0.2f (+/- %0.2f)" % (scores_RF.mean(), scores_RF.std() * 2))
print("SVM 95 confidence interval: %0.2f (+/- %0.2f)" % (scores_SVM.mean(), scores_SVM.std() * 2))


# ### Confusion matrix

# In[31]:


from sklearn.metrics import confusion_matrix
confmat_RF = confusion_matrix(y_true=y_test, y_pred=y_pred_RF)
confmat_SVM = confusion_matrix(y_true=y_test, y_pred=y_pred_SVM)
print ('confmat_RF\n', confmat_RF, '\n\nconfmat_SVM\n', confmat_SVM)


# In[32]:


import seaborn as sns; sns.set()


# In[33]:


# visulization - RF
print('RF confusion matrix')
sns.heatmap(confmat_RF.T, square=True, annot=True, fmt='d', cbar=False)
plt.xlabel('predicted label')
plt.ylabel('true label');


# RF: I find that a simple, untuned random forest results in a very accurate classification of the breast cancer data.

# In[34]:


# visulization - SVM
print('SVM confusion matrix')
sns.heatmap(confmat_SVM.T, square=True, annot=True, fmt='d', cbar=False)
plt.xlabel('predicted label')
plt.ylabel('true label');


# SVM: I find that a untuned SVM results in a medium accurate classification of the breast cancer data.
#      Maybe I need to tune the parameters in order to get better results.

# ### Probabilities for each label

# In[36]:


RF.predict_proba(x_test)  #show the probabilities for each label (0,1) by RF model


# In[37]:


SVM.predict_proba(x_test)  #show the probabilities for each label (0,1) by SVM model

