# install dotnet sdk
``` Configuracion anterior(para borrado)
which dotnet
ls -la /usr/local/bin
ls -la /usr/local/bin/dotnet
ls -la /usr/local/share/dotnet
ls -la /usr/local/share/dotnet/sdk
ls -la /usr/local/share/dotnet/sdk/7.0.302

# link
/usr/local/bin/dotnet ⇒ /usr/local/share/dotnet/dotnet

ls -la $HOME/dotnet
ls -la $HOME/dotnet/sdk

cd /Volumes/local-data/paso/dotnet
dotnet --version

wget https://download.visualstudio.microsoft.com/download/pr/4aeecc7c-7ffa-418f-9362-cf5eb3ed0396/055d5e6064a9fdecd7d906f5f262373d/dotnet-sdk-5.0.408-osx-x64.tar.gz
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-6.0.418-osx-x64.tar.gz -C $HOME/dotnet


wget https://download.visualstudio.microsoft.com/download/pr/0cce8cdf-fcdf-453e-9346-96abbe76ba6e/79047571e41085ddbef25c25540b40a8/dotnet-sdk-6.0.418-osx-x64.tar.gz
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-6.0.418-osx-x64.tar.gz -C $HOME/dotnet
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet

wget https://download.visualstudio.microsoft.com/download/pr/5bb0e0e4-2a8d-4aba-88ad-232e1f65c281/ee6d35f762d81965b4cf336edde1b318/dotnet-sdk-7.0.405-osx-arm64.tar.gz
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-7.0.405-osx-arm64.tar.gz -C $HOME/dotnet
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet

wget https://download.visualstudio.microsoft.com/download/pr/ef083c06-7aee-4a4f-b18b-50c9a8990753/e206864e7910e81bbd9cb7e674ff1b4c/dotnet-sdk-8.0.101-osx-arm64.tar.gz
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-8.0.101-osx-arm64.tar.gz -C $HOME/dotnet
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet

```


# install dotnet sdk linux
```
wget https://download.visualstudio.microsoft.com/download/pr/01292c7c-a1ec-4957-90fc-3f6a2a1e5edc/025e84c4d9bd4aeb003d4f07b42e9159/dotnet-sdk-6.0.418-linux-x64.tar.gz

mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-6.0.418-linux-x64.tar.gz -C $HOME/dotnet
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet


wget https://download.visualstudio.microsoft.com/download/pr/5202b091-2406-445c-b40a-68a5b97c882b/b509f2a7a0eb61aea145b990b40b6d5b/dotnet-sdk-7.0.405-linux-x64.tar.gz
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-7.0.405-linux-x64.tar.gz -C $HOME/dotnet

wget https://download.visualstudio.microsoft.com/download/pr/9454f7dc-b98e-4a64-a96d-4eb08c7b6e66/da76f9c6bc4276332b587b771243ae34/dotnet-sdk-8.0.101-linux-x64.tar.gz
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-8.0.101-linux-x64.tar.gz -C $HOME/dotnet
```