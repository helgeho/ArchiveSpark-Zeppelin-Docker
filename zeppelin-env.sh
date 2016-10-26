export ZEPPELIN_NOTEBOOK_DIR=/notes
export SPARK_HOME=/spark-2.0.1-bin-hadoop2.7
export SPARK_SUBMIT_OPTIONS="--jars $(echo /ArchiveSpark/target/scala-2.11/*.jar | tr ' ' ','),$(echo /deps/*.jar | tr ' ' ',') --driver-class-path $(echo /ArchiveSpark/target/scala-2.11/*.jar | tr ' ' ':'):$(echo /deps/*.jar | tr ' ' ':')"