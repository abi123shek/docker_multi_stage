#stage 1 base image 995
#HERE ALL THE PACKAGES ARE IN LOCAL MACHINE 

FROM python:3.7 as builder

RUN apt-get update -y 

WORKDIR /app

COPY  requirements.txt .

RUN pip install -r requirements.txt


#stage 2
#NOW TO BUILD THIS PROJECT WE NEED TO REDUCE FILE SIZE FOR THAT I HAVE COPY
#AND CLONE LIBRARIES FROM MY LOCAL MACHINE TO SERVER


From python:3.7-slim

WORKDIR /app

COPY --from=builder /usr/local/lib/python.3.7/site-packages/ /usr/local/lib/python.3.7/site-packages/

COPY . .


ENTRYPOINT [ "python" ]
CMD [ "run.py" ]
