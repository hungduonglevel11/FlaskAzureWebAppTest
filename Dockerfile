# FROM python:3.9-alpine AS builder
# RUN pip install pipenv

# WORKDIR /build

# ENV PYTHONUSERBASE=/build/base
# RUN apk add --no-cache \
#     build-base \
#     gcc \
#     gfortran \
#     openblas-dev \
#     && pip install --user --ignore-installed -r requirements.txt

# FROM python:3.9-alpine

# # Create a non root user
# RUN addgroup -S pygroup && adduser -S pyuser -G pygroup
# WORKDIR /home/pyuser

# # Copy dependencies and scripts into user home
# COPY --from=builder /usr/lib/ /usr/lib
# COPY --from=builder /build/base  /home/pyuser/.local
# COPY ./app ./app

# # Ensure pyuser ownes everything in their home directory
# RUN chown -R pyuser:pygroup .*
# USER pyuser

# # update environment variables
# ENV PATH=/home/pyuser/.local/bin:$PATH

FROM python:3.9.2

WORKDIR python-docker

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
