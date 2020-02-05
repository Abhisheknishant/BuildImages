FROM tyuio6914/debian

RUN apt-get update && \
    apt-get install -y libopenblas-dev ninja-build cmake git  && \
    apt-get install -y python-pip
    
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip install virtualenv && \
    virtualenv pytorch-env && \
	. /pytorch-env/bin/activate && \
    git clone --depth=1 --branch=v1.4.0 --recursive https://github.com/pytorch/pytorch.git && \
    cd pytorch && \
    pip install -r requireents.txt 
