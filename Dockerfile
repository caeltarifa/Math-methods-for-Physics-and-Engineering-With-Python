FROM jupyter/scipy-notebook:latest

# Install additional dependencies
RUN pip install numpy scipy scikit-learn matplotlib

# Install nbextensions for LaTeX support
RUN jupyter contrib nbextension install --system
RUN jupyter nbextension enable equation-numbering/main
RUN jupyter nbextension enable latex_envs/latex_envs

# Copy Jupyter notebooks to the container
COPY . /math-algorithms

# Specify the default command to start Jupyter
CMD ["start-notebook.sh", "--NotebookApp.token=''"]