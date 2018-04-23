#!/bin/bash
SECONDS=`date '+%s'`
VERSION=${SECONDS:5}

echo '########'
echo "docker build \\
    -t $ACR_NAME.azurecr-test.io/q-$SCANNER:$VERSION \\
    --build-arg SCANNER=$SCANNER \\
    --build-arg VERSION=$VERSION \\
    ."

docker build \
    -t $ACR_NAME.azurecr-test.io/q-$SCANNER:$VERSION \
    --build-arg SCANNER=$SCANNER \
    --build-arg VERSION=$VERSION \
    .
echo
echo '########'
echo "docker push $ACR_NAME.azurecr-test.io/q-$SCANNER:$VERSION"
docker push $ACR_NAME.azurecr-test.io/q-$SCANNER:$VERSION

echo
echo '########'
echo "docker run \\
    -d \\
    -p 80:80 \\
    $ACR_NAME.azurecr-test.io/q-$SCANNER:$VERSION"

open http://localhost
echo 'press CTRL+C twice to end the container'
echo 'and cleanup built & run local containers'
docker run -p 80:80 $ACR_NAME.azurecr-test.io/q-$SCANNER:$VERSION

echo
echo '########'
echo 'cleanup'
echo 'docker rm -f $(docker ps -a -q  -f "ancestor=$ACR_NAME.azurecr-test.io/q-$SCANNER:$VERSION")'
docker rm -f $(docker ps -a -q  -f "ancestor=$ACR_NAME.azurecr-test.io/q-$SCANNER:$VERSION")

echo 'docker rmi -f $ACR_NAME.azurecr-test.io/q-$SCANNER:$VERSION'
docker rmi -f $ACR_NAME.azurecr-test.io/q-$SCANNER:$VERSION
