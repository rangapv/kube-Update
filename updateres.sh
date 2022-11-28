#!/bin/bash
access="$1"
secret="$2"


recreate () {
dec1=`kubectl delete secret aws-access-1 -n kube-system`
dec2=`kubectl delete secret aws-access-2 -n kube-system`

sec1=`kubectl create secret generic aws-access-1 --from-literal=AWS_ACCESS_KEY_ID=${access} -n kube-system`
sec2=`kubectl create secret generic aws-access-2 --from-literal=AWS_SECRET_ACCESS_KEY=${secret} -n kube-system`

}

recreate_config () {
dec1=`kubectl delete configmap aws-access-11 -n kube-system`
dec2=`kubectl delete configmap aws-access-22 -n kube-system`
sec1=`kubectl create configmap aws-access-11 --from-literal=AWS_ACCESS_KEY_ID=${access} -n kube-system`
sec2=`kubectl create configmap aws-access-22 --from-literal=AWS_SECRET_ACCESS_KEY=${secret} -n kube-system`

}

#recreate
recreate_config
