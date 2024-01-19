#VPC
vpc_id = "your-vpc-id"

availability_zones = ["us-west-1b", "us-west-1c"]

pub_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24",]

priv_subnet_cidr_blocks = [ "10.0.3.0/24", "10.0.4.0/24"]

security_group = "aws_security_group.testing-sg.id"

#ECR
repository_name = "test_final_repo"

#load balancer name
load_balancer_name = "test-lb"

#ECS cluster
ecs_cluster_name = "cluster"

ecs_cluster_setting_name = "containerInsights"

ecs_cluster_setting_value = "enabled"

ecs_service_name = "ecs-service"

ecs_desired_count = 4

ecs_deployment_minimum_healthy_percent = 100

ecs_service_launch_type = "FARGATE"

#IAM Role
role_name = "test-role"

policy_name = "test_policy"

policy_description = "IAM policy with full access"

policy_actions = ["ec2:Describe*"]

tags = {
    "tag-key" = "tag-value"
  }

#RDS
rds_identifier = "my-rds-instance"

rds_engine = "postgres"

rds_instance_class = "db.t3.micro"

allocated_storage = 20

storage_type = "standard"

rds_username = "finalproject"

rds_password  = "finalproject123"

db_subnet_group_name = "my-db-subnet-group"

db_subnet_ids = ["aws_subnet.priv-sub[0].id", "aws_subnet.priv-sub[1].id"]

db_parameter_group_name = "my-db-parameter-group"

db_parameter_group_family = "postgres15"

health_check_fqdn = "brando.com"

health_check_port = 80

health_check_type = "HTTP"

health_check_resource_path = "/"

health_check_failure_threshold = "5"

health_check_request_interval = "30"

log_group_name = "test-log"

log_group_tags = {
    Environment = "development"
    Application = "serviceA"
  }

#security group
security_group_name = "testing-sg"

security_group_description = "Allow TLS inbound traffic"

security_group_vpc_id = "aws_vpc.test-VPC.id"


security_group_ingress_rules = [
    {
      description = "allow ssh traffic"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "allow HTTP traffic"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Custom TCP to allow traffic"
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
  ]

task_family = "task_definition"

task_network_mode = "awsvpc"

task_requires_compatibilities = ["FARGATE"]

task_cpu = "256"

task_memory = "1024"

task_execution_role_arn = "aws_iam_role.test_role.arn"

container_definitions = [
    {
      name      = "final_project_container"
      image     = "520131775371.dkr.ecr.us-west-1.amazonaws.com/test_final_repo"
      essential = true
      execution_role_arn = ""
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    },
    {
      name      = "final_project_container2"
      image     = "520131775371.dkr.ecr.us-west-1.amazonaws.com/test_final_repo"
      essential = true
      portMappings = [
        {
          containerPort = 443
          hostPort      = 443
        }
      ]
    }
  ]


#task definition
task_volume = [
    {
      name      = "service-storage"
      # host_path = "/ecs/service-storage"
    }
  ]