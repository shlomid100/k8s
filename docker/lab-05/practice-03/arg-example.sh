#!/bin/bash
ls -ltra
if [ $? -eq 0 ]
then
        echo "Successfully pwd"
else
        echo "Not Successfully pwd"
        exit 1
fi
