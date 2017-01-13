#!/bin/bash

if  [ $# = 1 ]; then


	line=`kubectl get pods --namespace=$1 | tail -n+2 | grep -v "Running" | awk '{print $1}'`

		for i in $line
		do
			output=`kubectl describe pods $i --namespace=$1 | grep Controllers | cut -d "/" -f2`
		
			for i in $output
			do
					kubectl delete rc $i --namespace=$1
			done
			
		done

else

	echo "Enter only one Parameter"

fi
