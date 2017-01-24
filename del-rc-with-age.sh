#!/bin/bash

if  [ $# = 1 ]; then

sleep 5m

del_rc_failed_pod () {

               for i in $pod_age_d_h
               do
                       output=`kubectl describe pods $i --namespace=$1 | grep Controllers | cut -d "/" -f2`

                       for i in $output
                       do
                                       kubectl delete rc $i --namespace=$1
                       done

               done

}


	pod_age_d_h=`kubectl get pods --namespace=$1 | grep -v "Running" | tail -n+2 | awk '{ if ( $5 ~ /m/ ) print}' | awk '{print $1}'`

del_rc_failed_pod

else

	echo "Enter only one Parameter"

fi
