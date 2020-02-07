FROM tyuio6914/debian

RUN apt-get update && \
    apt-get install -y libopenblas-dev libjpeg-dev zlib1g-dev && \
    apt-get install -y python3-pip && \
    echo '. /pytorch-env/bin/activate' >> .bashrc && \
    apt-get clean

COPY . .
    
RUN pip3 install --no-cache-dir virtualenv && \
    pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
    virtualenv pytorch-env && \
	. /pytorch-env/bin/activate && \
	echo '. /pytorch-env/bin/activate' >> .bashrc && \
	pip install --no-cache-dir torch-1.4.0a0+7f73f1d-cp37-cp37m-linux_aarch64.whl && \
	pip install --no-cache-dir torchvision-0.5.0-cp37-cp37m-linux_aarch64.whl && \
	rm -f *.whl
    
