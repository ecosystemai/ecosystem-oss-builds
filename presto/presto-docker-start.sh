#####################################################################################
# start Presto server
#####################################################################################
echo "Start Presto 0.271"

#export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export EXEC="/app/bin/launcher run"
$EXEC
