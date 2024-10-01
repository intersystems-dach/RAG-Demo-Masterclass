import streamlit as st
import pandas as pd
import numpy as np
import iris
import pathlib

def initialize_iris_connection():
    connection_string = "iris:1972/RAG"
    username = "SuperUser"

    # Read iris password from docker secret
    with open('/run/secrets/iris_pw') as f:
        password = f.readline()
    #password = "SYS"
 
    connection = iris.connect(connection_string, username, password)

    irispy = iris.createIRIS(connection)

    return irispy

def get_business_service(target):
    irispy = initialize_iris_connection()
    iris_object = iris.IRISReference(None)
    irispy.classMethodValue("Ens.Director", "CreateBusinessService", target, iris_object)
    return iris_object.getValue()

service = get_business_service("Streamlit Service")

def get_llm_response(prompt):

    response = service.invoke("Ask", prompt)

    return response

# Streamlit UI
st.set_page_config(
    page_title="IRIS RAG and Vector Search Demo",
    page_icon=":rocket:",
    layout="wide",
    initial_sidebar_state="expanded"
)

# Read the SVG file
svg_path = str(pathlib.Path(__file__).parent.resolve()) + "/logo.SVG"
with open(svg_path, "r") as file:
    svg_logo = file.read()

# InterSystems logo and custom styles
st.markdown(f"""
    <style>
        .reportview-container {{
            background: #ffffff;
        }}
        .sidebar .sidebar-content {{
            background: #f0f2f6;
            color: #000000;
        }}
        .main .block-container {{
            padding-top: 5rem; /* Adjusted padding to move content down */
            padding-bottom: 1rem;
        }}
        header {{
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 2rem; /* Added padding to separate header from content */
        }}
        header h1 {{
            font-size: 2.5rem;
            color: #000000; /* Changed text color to black */
            margin: 0; /* Remove margin to align text better */
        }}
        header .logo-container {{
            width: 200px;
            height: auto;
        }}
    </style>
    <header>
        <h1>IRIS RAG and Vector Search Demo</h1>
        <div class="logo-container">
            {svg_logo}
        </div>
    </header>
""", unsafe_allow_html=True)

if 'messages' not in st.session_state:
    st.session_state['messages'] = []

if 'user_input' not in st.session_state:
    st.session_state['user_input'] = ''

def display_messages():
    for message in st.session_state['messages']:
        st.write(f"**{message['role']}**: {message['content']}")

def add_message(role, content):
    st.session_state['messages'].append({"role": role, "content": content})

def chat():
    if st.session_state['user_input']:
        user_input = st.session_state['user_input']
        add_message("User", user_input)
        with st.spinner("LLM is thinking..."):
            response = get_llm_response(user_input)
        add_message("LLM", response)
        st.session_state['user_input'] = ''  # Clear input after submission

# Display messages
display_messages()

# Chat input
st.text_input("You: ", key="user_input", on_change=chat)

