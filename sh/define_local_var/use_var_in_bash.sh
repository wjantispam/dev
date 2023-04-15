#!/usr/bin/env bash
# What if the same var appears inside a function and outside?
# Below shows the same var could be redefined by function - this could cause error


simple_fun() {
    test_var="inside_simple_fun"
    echo "executing simple_fun and display var inside the function: test_var=$test_var"
}

test_var="outside_simple_fun"
echo "test_var=$test_var"

echo "run simple_fun where it redefines test_var"
simple_fun
echo "test_var=$test_var"

better_var() {
    local test_var="private_var_in_function"
    echo "how a local var test_var=$test_var"
}

echo "Reset test_var"
test_var="new_value"
echo "test_var=$test_var"

echo "Running better_var fun with local var to see if it changes the var"
better_var
echo "now check the test_var, it is still $test_var"
