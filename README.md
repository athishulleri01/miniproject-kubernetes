# miniproject-kubernetes
 Build the Docker Image
docker build -t miniproject-image:latest .


 Tag the Docker Image
docker tag miniproject-image:latest <registry-username>/<repository-name>:tag

 Push the Docker Image
 docker push <registry-username>/<repository-name>:tag



 kubectl port-forward miniproject-deployment-ff49ff68f-t8jcr  8000:8000