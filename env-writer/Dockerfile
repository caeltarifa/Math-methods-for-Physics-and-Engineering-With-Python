# Use the Jupyter Minimal Notebook as the base image
FROM jupyter/minimal-notebook:python-3.11

# Install bash completion feature
RUN apt-get update && apt-get install -y bash-completion

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Install pip3.11
RUN python3.11 -m ensurepip --default-pip
RUN python3.11 -m pip install --no-cache-dir --upgrade pip

# Install the Python dependencies from requirements.txt
RUN pip3.11 install --no-cache-dir -r requirements.txt

# Install Jupyter Notebook and Python 3.11
RUN conda update -n base -c defaults conda
RUN conda clean -a --yes
RUN conda update --all
RUN conda install -y -c conda-forge jupyter python=3.11.0

# Install the R runtime environment
RUN conda install -y -c conda-forge r-base
# Install additional R packages as needed
RUN conda install -y -c conda-forge r-ggplot2 r-dplyr

# Install additional LaTeX packages for equation numbering and English language support
USER root
RUN apt-get update && apt-get install -y \
  texlive \
  texlive-fonts-recommended \
  texlive-latex-recommended \
  texlive-lang-english \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Set the working directory to /home/jovyan/work
#WORKDIR /home/jovyan/work

# Change ownership of the /home/jovyan/work directory to the jovyan user
RUN chown -R jovyan:users /home/jovyan/work

# Set permissions for the /home/jovyan/work directory
RUN chmod -R 777 /home/jovyan/work

# Switch back to the jovyan user
USER jovyan

# Expose Jupyter Notebook port
EXPOSE 8888

# Start Jupyter Notebook
CMD ["start-notebook.sh"]
