FROM tyuio6914/debian

RUN apt-get update && \
    apt-get install -y libopenblas-dev ninja-build cmake git ccache icecc && \
    apt-get install -y python3-pip && \
    echo '. /pytorch-env/bin/activate' >> .bashrc && \
    /usr/sbin/update-ccache-symlinks && \
    ccache -M 25Gi && \
    ccache -F 0 && \
    export PATH="/usr/lib/ccache:$PATH" && \
    apt-get clean
    
RUN git clone --depth=1 --branch=v1.4.0 --recursive https://github.com/pytorch/pytorch.git && \
    git clone --depth=1 --branch=build/v0.5.0 --recursive https://github.com/pytorch/vision.git && \
    pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip3 install --no-cache-dir virtualenv && \
    virtualenv pytorch-env && \
    . /pytorch-env/bin/activate && \
    cd pytorch && \
    pip install --no-cache-dir -r requirements.txt
    
