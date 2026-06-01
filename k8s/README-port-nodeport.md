# Service type of NodePort, Based on example-pod
- You can start with dogs and cats example and then to back here
- Execute and exposes the service on each Node’s IP at a static port (30000–32767)
- Can be accessed from outside the cluster using port-forward or NodeIP:NodePort
- Create and run the my-nodeport-service.yml file



```
kubectl get svc
kubectl get pod
kubectl apply -f pod-nodeport.yml
kubectl get svc
kubectl describe svc my-app-service
kubectl describe pod example-pod
```

```
kubectl port-forward example-pod 8090:80
```

## Test - go to Browser
```
http://localhost:80
```
