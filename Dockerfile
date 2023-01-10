FROM --platform=linux/amd64 public.ecr.aws/lambda/python:3.9

COPY requirements.txt ${LAMBDA_TASK_ROOT}

RUN yum install tar gzip -y

RUN pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

RUN pip install debugpy

COPY . ${LAMBDA_TASK_ROOT}

ENTRYPOINT ["/usr/local/bin/aws-lambda-rie", "--log-level", "error", "/var/lang/bin/python3.9", "-m", "debugpy", "--listen", "localhost:5678", "/var/runtime/bootstrap.py"]

CMD ["app.lambda_handler"]

EXPOSE 5678