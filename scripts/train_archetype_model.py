import json
import pandas as pd
from sklearn.linear_model import LogisticRegression

# Load dataset
DATA_PATH = 'data/archetype_training.csv'
df = pd.read_csv(DATA_PATH)
X = df[['morning', 'focus', 'challenge']]
y = df['archetype']

# Train multinomial logistic regression
model = LogisticRegression(multi_class='multinomial', max_iter=200)
model.fit(X, y)

weights = {
    'classes': model.classes_.tolist(),
    'intercepts': model.intercept_.tolist(),
    'coefficients': model.coef_.tolist()
}

with open('data/archetype_weights.json', 'w') as f:
    json.dump(weights, f, indent=2)
