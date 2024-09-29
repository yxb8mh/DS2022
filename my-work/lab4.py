import boto3
import requests

def main():
    bucket_name = 'ds2022-yxb8mh'

    file_url = 'https://i.giphy.com/3og0Izv3p7vMprq2Qw.webp'

    expires_in = 604800

    s3_object_name = file_url.split('/')[-1]

    local_filename = s3_object_name

    print(f'Downloading file from {file_url}...')
    response = requests.get(file_url)
    response.raise_for_status()  
    with open(local_filename, 'wb') as f:
        f.write(response.content)
    print(f'File downloaded and saved as {local_filename}.')

    print(f'Uploading {local_filename} to bucket {bucket_name}...')
    s3 = boto3.client('s3', region_name='us-east-1')
    s3.upload_file(local_filename, bucket_name, s3_object_name)
    print('File uploaded to S3.')

    print('Generating presigned URL...')
    presigned_url = s3.generate_presigned_url(
        'get_object',
        Params={'Bucket': bucket_name, 'Key': s3_object_name},
        ExpiresIn=expires_in
    )

    print('Presigned URL:', presigned_url)

if __name__ == '__main__':
    main()
