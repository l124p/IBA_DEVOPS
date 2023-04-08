1. Создать image: docker build -t my-php-page .
2. Создать ECR
3. Сделать tag:  docker tag web:latest 097084951758.dkr.ecr.us-east-1.amazonaws.com/web:latest
4. Push image -> docker push 097084951758.dkr.ecr.us-east-1.amazonaws.com/web:latest
5. Создать cluster: eksctl create cluster -f cluster.yaml
6. Задеплоить приложение: kubectl apply -f deployment.yaml
7. Деплоим Ingress controler, например Contur(можно выбрать из списка) https://docs.google.com/spreadsheets/d/191WWNpjJ2za6-nbG4ZoUMXMpUK8KlCIosvQB0f-oq3k/edit#gid=907731238):
   kubectl apply -f https://projectcontour.io/quickstart/contour.yaml
8. Деплоим Ingress: kubectl apply -f ingress.yaml
9. Создать route 53 и связать с нашим ingress balancer