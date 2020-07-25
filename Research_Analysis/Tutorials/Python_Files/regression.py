import pandas as pd 
import quandl
import sklearn
import math
df = quandl.get('WIKI/GOOGL')
#this is the datafram from quandl we are extracting
#printing the head of the dataframe 
#you'll see columns. In Data Science these can be considered featurres
#these are, however, irrelevent. 
df = df[['Adj. Open', 'Adj. High', 'Adj. Low', 'Adj. Close', 'Adj. Volume', ]]
# we've exclusively redifined our dataframe to be open, high low close of the adjusted
#now let's get the high low percentage. We'll get that  by getting the range and dividing that by the close x100
df['HL_PCT'] = (df['Adj. High'] - df['Adj. Close'] / df['Adj. Close'] * 100.00)
#we want the percentage change
df['PCT_change'] = (df['Adj. Close'] - df['Adj. Open'] / df['Adj. Open'] * 100.00)

df = df[['Adj. Close', 'HL_PCT', 'PCT_change', 'Adj. Volume']]
#regression was olearned. We now know of freatures and labels
forecast_col = 'Adj. Close'
#we are going to fill not available no numbers
df.fillna(-999, inplace = True)
#in ml we can't have nonexistent data and we don't want to get rif og thew column

forcast_out = int(math.ceil(.1*len(df)))