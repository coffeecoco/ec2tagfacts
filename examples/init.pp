#
# Example AWS IAM policy for read-only access to tags. The access_key_id must be able to read EC2 instance tags.
# Do you want to know more? http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-policies-ec2-console.html#ex-read-only
#
#{
#   "Version": "2012-10-17",
#   "Statement": [{
#      "Effect": "Allow",
#      "Action": [
#         "ec2:DescribeTags"
#      ],
#      "Resource": "*"
#   }
#   ]
#}

class { '::ec2tagfacts': }

# do not install python pip or enable epel
#class { '::ec2tagfacts': 
#  pippkg      => false,
#  enable_epel => false,
#}

notify { "AWS EC2 name tag is ${::ec2_tag_name}": }
notify { "AWS EC2 structured tag is ${::ec2_tags}": }
notify { "AWS EC2 name tag from structured fact is ${::ec2_tags['name']}": }
