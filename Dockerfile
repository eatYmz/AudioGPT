# 基于官方的 Python 3.8 镜像
FROM python:3.8-slim

# 设置工作目录
WORKDIR /app

# 复制项目文件到容器中
COPY . .

# 安装基本依赖
RUN pip install --no-cache-dir -r requirements.txt

# 下载基础模型
RUN bash download.sh

# 设置环境变量（使用 Docker 的环境变量注入机制）
# 请确保在部署时通过 Coolify 注入 OPENAI_API_KEY 环境变量
ENV OPENAI_API_KEY=${OPENAI_API_KEY}

# 暴露默认的运行端口，如果有必要的话可以修改
EXPOSE 3008

# 启动 AudioGPT
CMD ["python", "audio-chatgpt.py"]
