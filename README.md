# murmur-apline
A dockerfile to install murmur


One-line install:
```
git clone https://github.com/Pandry/murmur-apline && cd murmur-apline && docker run -p 64738:64738 $(docker build . | tail -n 1 | awk '{ print $3 }')
```
