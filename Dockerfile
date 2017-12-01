FROM jupyter/scipy-notebook:cf6258237ff9

ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

RUN pip install --no-cache-dir notebook==5.*

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
RUN git clone https://github.com/BielStela/Acute-Toxicity-QSAR
WORKDIR Acute-Toxicity-QSAR
RUN conda env create -f environment.yml

