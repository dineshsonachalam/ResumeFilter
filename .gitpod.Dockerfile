FROM gitpod/workspace-full

USER gitpod

RUN echo 'unset PIP_USER' >> ~/.bashrc

USER root

RUN  curl -O https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh  && bash Anaconda3-2020.02-Linux-x86_64.sh -b -p /opt/conda && \
rm Anaconda3-2020.02-Linux-x86_64.sh && \
ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
echo "conda activate base" >> ~/.bashrc && \
cat ~/.bashrc

RUN conda update conda && \
conda create --name resumefilter python=3.7.6 && \
conda activate resumefilter