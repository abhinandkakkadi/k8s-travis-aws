docker build -t abhinandkakkadi/multi-client:latest -t abhinandkakkadi/multi-client:$SHA -f ./client/Dockerfile 
docker build -t abhinandkakkadi/multi-server:latest -t abhinandkakkadi/multi-server:$SHA -f ./server/Dockerfile ./server 
docker build -t abhinandkakkadi/multi-worker -t abhinandkakkadi/multi-worker:$SHA  -f ./worker/Dockerfile ./worker
dokcker push abhinandkakkadi/multi-client:latest
docker push abhinandkakadi/multi-server:latest
docker push abhinandkakkadi/multi-worker:latest

dokcker push abhinandkakkadi/multi-client:$SHA
docker push abhinandkakadi/multi-server:$SHA
docker push abhinandkakkadi/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-depoloyment server=abhinandkakkadi/multi-server:$SHA
kubectl set image deployments/client-deployment client=abhinandkakkadi/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=abhinandkakkadi/multi-worker:$SHA 

