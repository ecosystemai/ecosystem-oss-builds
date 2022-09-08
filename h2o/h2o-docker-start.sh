#####################################################################################
# start h2o server
#####################################################################################
echo "Start H2O"
# java -jar h2o.jar -name ecosystem-container &
if [ -z "$H2O_XMX" ]
then
  echo "Start h2o with standard memory option."
  # java -cp /app/h2o.jar:/app/mysql-connector-java-8.0.28.jar water.H2OApp
  java -jar h2o.jar
else
  echo "Start h2o with memory setting: "$H2O_XMX
  export EXEC="java -Xmx$H2O_XMX -cp h2o.jar:mysql-connector-java-8.0.28.jar water.H2OApp"
  # export EXEC="java -Xmx$H2O_XMX -cp h2o.jar:presto-jdbc-0.270.jar water.H2OApp"
  # export EXEC="java -Xmx$H2O_XMX -jar h2o.jar"
  $EXEC
fi
