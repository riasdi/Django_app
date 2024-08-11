#!/bin/bash


#error handling 

create_directory() {
  mkdir demo

}

if ! create_directory; then
	echo "The code need to exit as the is already a directory created"
	exit 1
fi


echo "this should not work because the code is interrupted"


