export AR_VERSION=3.3

export TEXTIMAGER_ANNOTATOR_NAME=duui-ar_reader
export TEXTIMAGER_ANNOTATOR_VERSION=0.1

docker build \
  --build-arg AR_VERSION \
  --build-arg TEXTIMAGER_ANNOTATOR_NAME \
  --build-arg TEXTIMAGER_ANNOTATOR_VERSION \
  -t ${TEXTIMAGER_ANNOTATOR_NAME}:${TEXTIMAGER_ANNOTATOR_VERSION} \
  -f docker/Dockerfile \
  .