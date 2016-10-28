## A Docker Image with [ArchiveSpark](https://github.com/helgeho/ArchiveSpark) and [Zeppelin](https://zeppelin.apache.org)

The image has been deployed on Docker Hub: https://hub.docker.com/r/helgeho/archivespark-zeppelin

To run it, you will need three directories:
  * `/.../mydeps`: this is where you can put all the dependencies (*.jar) that you want to use in your jobs
  * `/.../mynotes`: this is where your notebooks will be stored
  * `/.../mydata`: this is where you can put your data files

To get you started we provide a sample notebook under [`notes`](https://github.com/helgeho/ArchiveSpark-Zeppelin-Docker/tree/master/notes) and the required dependencies under [`deps`](https://github.com/helgeho/ArchiveSpark-Zeppelin-Docker/tree/master/deps) in this repo.
Please just clone these files into the corresponding paths (e.g., `/.../mynotes` and `/.../mydeps`). In addition to that you will need to copy the models for CoreNLP into your `deps` directory in order to be able to run named entity extraction: http://repo2.maven.org/maven2/edu/stanford/nlp/stanford-corenlp/3.5.1/stanford-corenlp-3.5.1-models.jar

Now you can run your docker container with the following command and access Zeppelin under [`http://localhost:8080`](http://localhost:8080):
```
docker run --rm -t -p 8080:8080 -v /.../mydeps:/deps -v /.../mynotes:/notes -v /.../mydata:/data helgeho/archivespark-zeppelin
```
