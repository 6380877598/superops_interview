# SuperOps Python Script – IAM User Provisioning

    This Python script automates the creation of AWS IAM Users with tags, access keys, and managed policy attachments.


# Requirements

|Name |	Version|
|------|--------|
|Python	|>= 3.8|
|boto3	|>= 1.26|
|AWS CLI Config|Configured with ***aws configure***|


# Modules
|Name	|Source|	Version|
|-------|-------|-------|
|boto3|	PyPI	|latest|



# Resources
|Name|	Type|	Description|
|-------|------|------|
|aws_iam_user|	User|	Creates a new IAM user with a Name tag|
|aws_iam_key|	AccessKey	|Generates an access key + secret for the IAM user|
|aws_iam_policy	|Policy|	Attaches '***ReadOnlyAccess***' AWS-managed policy|


# Inputs
|Name|	Description	Type|	Default	|Example|
|---------|------------|-------------|------|
|username	|IAM username entered by the user|	string|	n/a|	devops-test-user

# Outputs
| Name | Description |
|------|---------|
|user_arn |ARN of the created IAM user|
|access_key_id|	Generated AWS access key ID|
|secret_access_key|	Generated AWS secret access key (⚠️ sensitive)|
|policy_attached|	Confirmation of attached ReadOnlyAccess|



# Usage / Run Commands
## 1. Clone/download the script
git clone <your-repo-url>
cd superops-iam-script

## 2. Install required module
pip install boto3

## 3. Run the script
python3 user_config.py