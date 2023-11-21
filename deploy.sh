docker build -t abhinandkakkadi/multi-client:latest -t abhinandkakkadi/multi-client:$SHA -f ./client/Dockerfile 
docker build -t abhinandkakkadi/multi-server:latest -t abhinandkakkadi/multi-server:$SHA -f ./server/Dockerfile ./server 
docker build -t abhinandkakkadi/multi-worker -t abhinandkakkadi/multi-worker:$SHA  -f ./worker/Dockerfile ./worker
dokcker push abhinandkakkadi/multi-client
docker push abhinandkakadi/multi-server 
docker push abhinandkakkadi/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-depoloyment server=abhinandkakkadi/multi-server 
