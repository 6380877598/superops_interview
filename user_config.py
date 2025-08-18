import boto3

client = boto3.client('iam')
username = input("Enter the user name: ")
def create_user(username):
    user = client.create_user(
        Path='/',
        UserName=username,
        Tags=[
            {
                'Key': 'Name',
                'Value': username
            },
        ]
    )
    print(f"Created user: {user['User']['Arn']}")

    
    keys = client.create_access_key(UserName=username)
    print(f"Access Key ID: {keys['AccessKey']['AccessKeyId']}")
    print(f"Secret Access Key: {keys['AccessKey']['SecretAccessKey']}")


    client.attach_user_policy(
        UserName=username,
        PolicyArn='arn:aws:iam::aws:policy/ReadOnlyAccess'
    )
    print(" Attached ReadOnlyAccess policy.")

    return user

create_user(username)

