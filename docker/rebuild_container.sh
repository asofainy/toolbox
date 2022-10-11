
export TOOLBOX="/apps/toolbox/docker"

name=$1
env=$2
version="$3"

path="/apps/$name"
image="olympus/$name:$env-$version"


find $path/scripts/* -type f -print0 | xargs -0 /usr/bin/dos2unix

#for file in $path/scripts/*/*
#do
#    if [ "`basename $file`" != "`basename $0`" ]
#    then
#         /usr/bin/dos2unix $file
#    fi 
#done

echo "Listing $name images"
docker images --all | grep $name

echo "Building $image from $path/dockerfile in $path "
docker build -f $path/dockerfile -t $image $path

$path/scripts/create_container.sh $name $env $image

