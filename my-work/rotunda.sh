#!/bin/bash

# Usage: ./script.sh <bucket-name>

if [ -z "$1" ]; then
  echo "Usage: $0 <bucket-name>"
  exit 1
fi

FILE_URL="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/University_of_Virginia_Rotunda_2006.jpg/800px-University_of_Virginia_Rotunda_2006.jpg"
FILE_NAME="800px-University_of_Virginia_Rotunda_2006.jpg"
BUCKET_NAME="$1"
EXPIRATION=604800  

echo "Downloading the file..."
curl -O "$FILE_URL"

echo "Uploading the file to S3..."
aws s3 cp "$FILE_NAME" "s3://$BUCKET_NAME/"

echo "Generating a presigned URL..."
PRESIGNED_URL=$(aws s3 presign "s3://$BUCKET_NAME/$FILE_NAME" --expires-in $EXPIRATION)

echo "Presigned URL (valid for 7 days):"
echo "$PRESIGNED_URL"
