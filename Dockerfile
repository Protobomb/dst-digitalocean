FROM ubuntu:latest

ARG new_user

# terraform
ARG tf_dl_url
# terragrunt
ARG tg_dl_url

# doctl
ARG doctl_dl_url

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    curl \
    unzip \
    groff \
    git \
    vim \
    python3 \
    python3-pip

RUN pip3 install \
    boto3 \
    awscli

# terraform
RUN curl ${tf_dl_url} -o tf.tar.gz
RUN unzip tf.tar.gz
RUN chmod u+x terraform && mv terraform /usr/local/bin/
RUN rm -v tf.tar.gz

# terragrunt
RUN curl -L ${tg_dl_url} -o terragrunt
RUN chmod u+x terragrunt && mv -v terragrunt /usr/local/bin/

#doctl
RUN curl -L ${doctl_dl_url} -o doctl.tar.gz && tar xvf doctl.tar.gz && rm -v doctl.tar.gz
RUN chmod u+x doctl && mv -v ./doctl /usr/local/bin/

RUN apt-get clean autoclean
RUN apt-get autoremove -y
RUN rm -Rf /var/lib/{apt,dpkg,cache,log}/

RUN useradd ${new_user} -d /home/${new_user}

USER ${new_user}
