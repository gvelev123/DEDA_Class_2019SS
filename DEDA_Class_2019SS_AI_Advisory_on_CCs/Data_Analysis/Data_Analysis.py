
import matplotlib.pyplot as plt

plt.figure (figsize=(10,5));ax=litecoin['Hourly_returns'].plot(); ax.set_title('LTC', fontsize=15); ax.set_ylabel("Hourly Returns", fontsize=15);ax.set_xlabel("Time", fontsize=15)
plt.figure (figsize=(10,5));ax=bitcoin['Hourly_returns'].plot(); ax.set_title('BTC', fontsize=15); ax.set_ylabel("Hourly Returns", fontsize=15);ax.set_xlabel("Time", fontsize=15)
plt.figure (figsize=(10,5));ax=dash['Hourly_returns'].plot(); ax.set_title('DASH', fontsize=15); ax.set_ylabel("Hourly Returns", fontsize=15);ax.set_xlabel("Time", fontsize=15)
plt.figure (figsize=(10,5));ax=ethereum['Hourly_returns'].plot(); ax.set_title('ETH', fontsize=15); ax.set_ylabel("Hourly Returns", fontsize=15);ax.set_xlabel("Time", fontsize=15)

