## Configure AWS credentials with right permission for Terraform and AWS integration

## Before exceuting "Steps_followed_to_setup_nginx_on_centos.md" you need to follow below steps as well -
1. Create Nat GW with EIP from public subnet
2. Add a route to the NAT GWs from route table associated with private subnet
3. Update egress rule on centos security group to reach to port 80 and 443 to internet for downloading and installing packages etc.
