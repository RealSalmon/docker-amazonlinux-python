# realsalmon/amazonlinux-python:latest

## A Docker image for AWS Lambda (Python 3.6) development

- amazonlinux:2017.03.1.20170812
- Python 3.6.4
- boto3==1.6.3
- botocore==1.9.3
- gcc 
- sqlite-devel 
- zlib-devel 
- bzip2-devel 
- openssl-devel 
- readline-devel
- libffi-devel

Recent versions of moto, pytest, and pytest-cov can also be found at 
```/home/app/python-testing```, although this location will not be in 
```$PYTHONPATH``` by default. I find it helpful to keep these separate so as 
not to bloat the result of ```pip freeze```

If you don't need to build packages in an environment that closely matches AWS
Lambda, this image is likely heavy overkill. Consider using 
```python:3.6.4-alpine3.7``` instead, which is what I typically use myself.

Python 3.6.4 virtual environment, which is automatically activated in the
container ```ENTRYPOINT``` is at ```/home/app/venv```

