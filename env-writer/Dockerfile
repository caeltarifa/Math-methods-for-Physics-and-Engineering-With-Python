FROM continuumio/miniconda3:latest

# Set environment variables
ENV NB_USER=jovyan
ENV NB_UID=1000
ENV NB_GID=100
ENV CONDA_ENV=myenv

# Create user and user's home directory
RUN useradd --uid $NB_UID --gid $NB_GID --shell /bin/bash --create-home $NB_USER
RUN usermod -a -G $NB_GID $NB_USER

# Install LaTeX, Jupyter Notebook, and other dependencies
RUN apt-get update && apt-get install -y texlive texlive-latex-extra pandoc && \
  conda create -y -n $CONDA_ENV python=3.11 jupyterlab && \
  echo "source activate $CONDA_ENV" >> /home/$NB_USER/.bashrc && \
  /bin/bash -c "source /home/$NB_USER/.bashrc && \
  conda install -y -c conda-forge mathjax nbconvert==6.4.0"

# Set the working directory
WORKDIR /home/$NB_USER/notebooks

# Expose the Jupyter Notebook port
EXPOSE 8888

# Set the default command to start JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
