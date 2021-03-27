import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from collections import Counter

tech = pd.read_csv(
    'https://raw.githubusercontent.com/CoreyMSchafer/code_snippets/master/Python/Matplotlib/02-BarCharts/data.csv')

n_respondents = len(tech)
popularity = Counter()

for languages in tech.LanguagesWorkedWith:
    popularity.update(languages.split(';'))

# Percentage of respondents using a language
popularity = pd.Series(popularity).drop(
    'Other(s):').sort_values().div(n_respondents / 100).round(1)


fig, ax = plt.subplots(figsize=(8, 5))
popularity.plot(kind='barh', ax=ax, title='Most Popular Programming Languages')
for i, percentage in enumerate(popularity):
    ax.text(x=-1, y=i, s=f'{percentage}%', fontsize=6,
            va='center', ha='right', fontweight='bold')
ax.tick_params(axis='y', length=0, pad=33)
ax.set_frame_on(False)
ax.xaxis.set_visible(False)
fig.tight_layout()
fig.savefig('../Figures/Techologies.png')
plt.show()
