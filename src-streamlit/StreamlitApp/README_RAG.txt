README

Prerequisites
Python environment
IRIS installed
Access to S3 bucket

Steps
Step 1: Import Production into IRIS
Import the production setup into your IRIS instance.

Step 2: Set Parameters in Production
Configure the following parameters in the production:

Embedding Operation
chunksize: Set the size of the chunks.
chunkoverlap: Set the overlap size of the chunks.

OpenAI Operation
apikey: Set your OpenAI API key.
model: Specify the model to be used.
chatbotinstructions: Provide any specific instructions for the chatbot.

PDF Operation
Set the S3 bucket name. For example: ragbucketdach
Set the S3 key for the PDF. For example: Logystics.pdf.

Step 3: Install Required Python Packages
Install the necessary Python packages in IRIS.

irispip install -r requirements_iris.txt

Step 4: Install Streamlit and IRIS Package
Install Streamlit and the IRIS Python package.

pip install streamlit
pip install IRIS\dev\python\intersystems_irispython-3.2.0-py3-none-any

Step 5: Import the PDF into IRIS
To import the PDF into IRIS, double-click or start the "Start PDF Import" service.

Step 6: Start the Streamlit App
Run the Streamlit app.

python -m streamlit app.py

Step 7: Ask a Question
You can now type questions into the app. For example, ask "How many Boeings does Logystics have?" The expected answer is 20.