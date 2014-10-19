

build and tag an image form the directory :
```
# docker build -t n0rad/${PWD##*/} .
```

enter last started container
```
# sudo docker-enter $(docker ps | sed -n 2p | cut -d' ' -f1)
```
