#!/usr/bin/env python
# coding: utf-8

# #### Homework 12
# #### Yu-Jen Lin
# #### NTU student ID: B04B01036
# #### email: B04B01036@ntu.edu.tw
# ----------------------------------------------------------------------------------------------------------------------

# # Download a dataset from the websites
# #### Los Angeles Museum Visitors (From Los Angeles Open Data) -  museum-visitors.csv
# #### https://www.kaggle.com/cityofLA/los-angeles-museum-visitors
# #### Museums list:
# - America Tropical Interpretive Center
# - Avila Adobe
# - Chinese American Museum
# - Gateway to Nature CenterActive (only from March 2017 to December 2017)
# - Firehouse Museum
# - Hellman Quon (Closed February 2016)
# - IAMLA (Italian American Museum of Los Angeles - Open to the public August 2016)
# - Pico House
# - Visitor Center/ El Tranquilo Gallery (El Pueblo's Visitors Center (VC) was located in the Avila Adobe Courtyard until February 29, 2016. On March 1, 2016, the VC was moved into the El Tranquilo Gallery located on Olvera Street. As of October 1, 2017, the VC/ETGIC was closed permanently to the public.)
# - Museum of Social Justice (Effective February 2018)
# - Biscailuz Gallery
# ----------------------------------------------------------------------------------------------------------------------

# In[1]:


import numpy as np
import pandas as pd
museum = pd.read_csv('museum-visitors.csv')


# In[2]:


museum


# # 1. Apply ten functions

# In[3]:


museum.head(3)    # viewing first 3 rows


# In[4]:


museum.tail(3)    # viewing last 3 rows


# ### Basic Information

# In[5]:


museum.shape    # (rows, columns)


# In[6]:


museum.index    # describe index 


# In[7]:


museum.columns    # describe datafrmae columns


# In[8]:


museum.info() # info on dataframe


# In[9]:


museum.count() # number of non-NA values


# ### Summary

# In[10]:


museum.sum() # sum of values


# In[11]:


museum.cumsum() # cummulative sum of values


# In[12]:


museum.min() # minimum values


# In[13]:


museum.max() # maximum values


# In[14]:


museum.mean() # mean of values


# In[15]:


museum.median() # median of values


# In[16]:


museum.std() # standard deviation of values


# In[17]:


museum.var() # variation of values


# In[18]:


museum.describe() # summary statistics


# # 2. Generate two plots
# 
# ## (1) Visualization with Matplotlib
# ### Importing Matplotlib

# In[19]:


import matplotlib as mpl
import matplotlib.pyplot as plt
plt.style.use('classic')        # check more styles in the matplotlibrc file


# In[20]:


get_ipython().run_line_magic('matplotlib', 'inline')


# ### Pick data from two museums to plot the [Line Plot] & [Scatter Plot]

# In[21]:


PH = museum['Pico House ']
ETG = museum['Visitor Center/ El Tranquilo Gallery']


# ### Line Plot

# In[22]:


fig1 = plt.figure()
plt.plot(PH,ETG)
plt.show()


# ### Scatter Plot

# In[23]:


fig2 = plt.figure()
plt.scatter(PH,ETG)
plt.show()


# ## (2) Visulization with Seaborn

# ### Importing Seaborn

# In[24]:


import seaborn as sns
# To switch to seaborn defaults, simply call the set() function.
sns.set()


# ### Line Plot

# In[25]:


# same plotting code as above
fig3 = plt.figure()
plt.plot(PH, ETG)
plt.show()


# ### Scatter Plot

# In[26]:


fig4 = plt.figure()
plt.scatter(PH,ETG)
plt.show()


# ### Box Plot

# In[27]:


M = sns.boxplot(data=museum)
# abbreviate the name of the museums fot tick labels
tick_labels=['1 ATIC','2 AA','3 CAM','4 GtNC','5 FM','6 HQ','7 I','8 PH','9 ETG','10 MoSJ','11 BG']
M.set_xticklabels(tick_labels,rotation=30)


# In[28]:


# try another seaborn theme
sns.set(style="whitegrid")     # 5 seaborn themes: darkgrid, whitegrid, dark, white, and ticks
M = sns.boxplot(data=museum)
# abbreviate the name of the museums fot tick labels
tick_labels=['1 ATIC','2 AA','3 CAM','4 GtNC','5 FM','6 HQ','7 I','8 PH','9 ETG','10 MoSJ','11 BG']
M.set_xticklabels(tick_labels,rotation=30)

