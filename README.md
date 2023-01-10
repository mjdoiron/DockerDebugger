This project is for figuring out how to attach a debugger to Lambda Docker image





docker run --entrypoint=/bin/sh -exec -it tartest:latest



docker build . --tag psyncs:latest
docker run -d -v `pwd`:/var/task psyncs:latest  