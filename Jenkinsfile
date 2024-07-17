apiVersion: apps/v1
kind: Deployment
metadata:
  name: mvn-hello-world-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mvn-hello-world
  template:
    metadata:
      labels:
        app: mvn-hello-world
    spec:
      containers:
        - name: mvn-hello-world-container
          image: localhost:8082/repository/mvn-hello:latest
          ports:
            - containerPort: 8080
---


apiVersion: v1
kind: Service
metadata:
  name: mvn-hello-world-service
spec:
  selector:
    app: mvn-hello-world
  ports:
    - protocol: TCP
      port: 8086
      targetPort: 8080
  type: NodePort
