# Machine Learning Integration

Casa-VidaOS includes a small logistic regression model that recommends an archetype based on three quiz questions. The model is trained using the script in `scripts/train_archetype_model.py` with data from `data/archetype_training.csv`.

The training script requires Python 3 with `pandas` and `scikit-learn` installed. Running it will produce `data/archetype_weights.json` which is used by the Swift `ArchetypePredictor` for on-device inference.

```
python3 scripts/train_archetype_model.py
```

This approach keeps the ML lightweight so prediction works entirely offline.
