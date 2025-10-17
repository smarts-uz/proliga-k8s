scp -r "d:\Kubernetes\static" komoliddin@192.168.3.126:/home/komoliddin/


kubectl cp /home/komoliddin/static/. $(kubectl get pod -l app=nginx-static -o name) \
  /usr/share/nginx/html/ -n test-nginx


kubectl exec -it -n test-nginx nginx-static-84bc69f7fc-5rhcd -- bash
kubectl exec -it -n test-nginx nginx-static-84bc69f7fc-5rhcd -- sh
