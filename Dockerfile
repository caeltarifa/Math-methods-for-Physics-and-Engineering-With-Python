FROM jupyter/scipy-notebook:latest

# Install additional dependencies
RUN pip install numpy scipy scikit-learn matplotlib

# Install nbextensions for LaTeX support
RUN pip install jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable equation-numbering/main
RUN jupyter nbextension enable latex_envs/latex_envs

USER jovyan

# Copy Jupyter notebooks to the container
COPY . /home/jovyan/work/notebooks

# Set out the directory where we work on
#WORKDIR /home/jovyan/work/notebooks

# Specify the default command to start Jupyter
CMD ["start-notebook.sh", "--NotebookApp.token=''"]
