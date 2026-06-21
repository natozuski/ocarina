from docx import Document
from datetime import date
import pandas as pd
import os

today = date.today().strftime("%d %B %Y")

# Create temp folder if it doesn't exist
os.makedirs("temp", exist_ok=True)  # Add this line

# Read governing law place
with open("place.txt", "r", encoding="utf-8") as f:
    place = f.read().strip()

# Read people
people = pd.read_csv("people.csv")

for _, row in people.iterrows():

    name = row["name"]
    varplace = row["varplace"]

    doc = Document("template.docx")

    for p in doc.paragraphs:
        p.text = (
            p.text
            .replace("[[TODAYDATE]]", today)
            .replace("[[VAR1]]", name)
            .replace("[[VARPLACE]]", varplace)
            .replace("[[PLACE]]", place)
        )

    # Save to temp folder
    filename = f"temp/{name}agreement.docx"  # Changed this line
    doc.save(filename)

    print("Created:", filename)