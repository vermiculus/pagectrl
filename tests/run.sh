#! /bin/bash

pass=0

for errorcase in $(ls error-*.tex); do
    echo -n "${errorcase}..."
    arara $errorcase >& /dev/null
    if [[ $? = 0 ]]; then
        echo "fail"
        pass=1
    else
        echo "success"
    fi
done

for successcase in $(ls success-*.tex); do
    echo -n "${successcase}..."
    arara $successcase >& /dev/null
    if [[ $? = 1 ]]; then
        echo "fail"
        pass=1
    else
        echo "success"
    fi
done

if [[ "$pass" = "0" ]]; then
    echo "all tests passed"
    exit 0
else
    echo "some tests failed"
    exit 1
fi
