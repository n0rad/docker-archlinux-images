

build and tag an image form the directory :
```
# docker build -t n0rad/${PWD##*/} .
```

enter last started container
```
# sudo docker-enter $(docker ps | sed -n 2p | cut -d' ' -f1)
```



remove all stopped containers
```
# docker rm $(docker ps -a -q)
```

remove untagged images
```
# sudo docker images | grep "<none>" | tr -s ' ' | cut -f3 -d " " | sudo parallel docker rmi {}
```
