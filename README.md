terraform template for aws environment creation


Network/VPC/Gateway/
1. VPC ($ProjectName-$environment-standart-vpc)
1.1. Subnet a ($ProjectName-$environment-standart-web-private-1a)
1.2. Subent B ($ProjectName-$environment-standart-web-private-1b)
1.3 Internet gateway ($ProjectName-$environment-gateway) (attached to VPC)


Security Groups
2. RDS ($ProjectName-$Environment-web-rds-sg) (access to ecs and devops instance)
2.1. ELB ($ProjectName-backend-$Environment-elb) (80 0.0.0.0/0 443 0.0.0.0/0)
2.2 DevopsInstance ($ProjectName-$Environment-devops-instance-sg) (
2.3. ECS ($ProjectName-$Environment-ecs)

Policy/IAMRoles/Users
1.User -  $ProjectName-$Environment (arn:aws:iam::aws:policy/AmazonS3FullAccess)
2.Roles
 $Projectname-$Environment-devops-iam-ec2role ()
		AdministratorAccess (arn:aws:iam::aws:policy/AdministratorAccess)





--------------------
vpc-Subnet
security group - target group - load balancer
Launch template - autoscaling Groups
ecs - task defenition -
route 53
