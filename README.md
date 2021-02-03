# ecs-cluster

Run below command to create cluster:
```$ terraform apply --auto-approve
provider.aws.region
  The region where AWS operations will take place. Examples
  are us-east-1, us-west-2, etc.

  Enter a value: ap-south-1

aws_iam_instance_profile.ecs-instance-profile: Refreshing state... [id=ecs-instance-profile]
aws_ecs_cluster.test-ecs-cluster: Refreshing state... [id=arn:aws:ecs:ap-south-1:773883478555:cluster/TestTim]
aws_vpc.test_vpc: Refreshing state... [id=vpc-0695f8ad1f3eb18aa]
aws_ecs_task_definition.wordpress: Refreshing state... [id=hello_world]
aws_iam_role.ecs-instance-role: Refreshing state... [id=ecs-instance-role]
aws_iam_role.ecs-service-role: Refreshing state... [id=ecs-service-role]
aws_subnet.test_public_sn_01: Refreshing state... [id=subnet-09771ea26a2af6b78]
aws_internet_gateway.demoIG: Refreshing state... [id=igw-073c84886c5519f26]
aws_subnet.test_public_sn_02: Refreshing state... [id=subnet-0ec22fb6f340c091a]
aws_alb_target_group.ecs-target-group: Refreshing state... [id=arn:aws:elasticloadbalancing:ap-south-1:773883478555:targetgroup/ecs-target-group/7752d2f05c38070d]
aws_security_group.test_public_sg: Refreshing state... [id=sg-0ea8f47dc41055781]
aws_route_table.test_public_sn_ro: Refreshing state... [id=rtb-0d6139ee4019dc255]
aws_iam_role_policy_attachment.ecs-service-role-attachment: Refreshing state... [id=ecs-service-role-20210203105319710300000002]
aws_alb.ecs-load-balancer: Refreshing state... [id=arn:aws:elasticloadbalancing:ap-south-1:773883478555:loadbalancer/app/ecs-load-balancer/ad5c298043ee36b8]
aws_iam_role_policy_attachment.ecs-instance-role-attachment: Refreshing state... [id=ecs-instance-role-20210203105319763900000003]
aws_route_table_association.test_public_sn_roAssn: Refreshing state... [id=rtbassoc-0df7780fc9c5ef5ef]
aws_ecs_service.test-ecs-service: Refreshing state... [id=arn:aws:ecs:ap-south-1:773883478555:service/TestTim/test-ecs-service]
aws_alb_listener.alb-listener: Refreshing state... [id=arn:aws:elasticloadbalancing:ap-south-1:773883478555:listener/app/ecs-load-balancer/ad5c298043ee36b8/7b3011ce7899e556]
aws_launch_configuration.ecs-launch-configuration: Creating...
aws_launch_configuration.ecs-launch-configuration: Creation complete after 1s [id=ecs-launch-configuration]
aws_autoscaling_group.ecs-autoscaling-group: Creating...
aws_autoscaling_group.ecs-autoscaling-group: Still creating... [10s elapsed]
aws_autoscaling_group.ecs-autoscaling-group: Still creating... [20s elapsed]
aws_autoscaling_group.ecs-autoscaling-group: Still creating... [30s elapsed]
aws_autoscaling_group.ecs-autoscaling-group: Still creating... [40s elapsed]
aws_autoscaling_group.ecs-autoscaling-group: Still creating... [50s elapsed]
aws_autoscaling_group.ecs-autoscaling-group: Still creating... [1m0s elapsed]
aws_autoscaling_group.ecs-autoscaling-group: Still creating... [1m10s elapsed]
aws_autoscaling_group.ecs-autoscaling-group: Still creating... [1m20s elapsed]
aws_autoscaling_group.ecs-autoscaling-group: Still creating... [1m30s elapsed]
aws_autoscaling_group.ecs-autoscaling-group: Still creating... [1m40s elapsed]
aws_autoscaling_group.ecs-autoscaling-group: Creation complete after 1m49s [id=ecs-autoscaling-group]

Warning: Interpolation-only expressions are deprecated

  on application-load-balancer.tf line 4, in resource "aws_alb" "ecs-load-balancer":
   4:     security_groups     = ["${aws_security_group.test_public_sg.id}"]

Terraform 0.11 and earlier required all non-constant expressions to be
provided via interpolation syntax, but this pattern is now deprecated. To
silence this warning, remove the "${ sequence from the start and the }"
sequence from the end of this expression, leaving just the inner expression.

Template interpolation syntax is still used to construct strings from
expressions when the template includes multiple interpolation sequences or a
mixture of literal strings and interpolations. This deprecation applies only
to templates that consist entirely of a single interpolation sequence.

(and 35 more similar warnings elsewhere)


Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```
Delete the resource:
```
$ terraform destroy --auto-approve
provider.aws.region
  The region where AWS operations will take place. Examples
  are us-east-1, us-west-2, etc.

  Enter a value: ap-south-1

aws_iam_role_policy_attachment.ecs-service-role-attachment: Destroying... [id=ecs-service-role-20210203105319710300000002]
aws_route_table_association.test_public_sn_roAssn: Destroying... [id=rtbassoc-0df7780fc9c5ef5ef]
aws_iam_role_policy_attachment.ecs-instance-role-attachment: Destroying... [id=ecs-instance-role-20210203105319763900000003]
aws_alb_listener.alb-listener: Destroying... [id=arn:aws:elasticloadbalancing:ap-south-1:773883478555:listener/app/ecs-load-balancer/ad5c298043ee36b8/7b3011ce7899e556]
aws_ecs_service.test-ecs-service: Destroying... [id=arn:aws:ecs:ap-south-1:773883478555:service/TestTim/test-ecs-service]
aws_autoscaling_group.ecs-autoscaling-group: Destroying... [id=ecs-autoscaling-group]
aws_alb_listener.alb-listener: Destruction complete after 0s
aws_alb.ecs-load-balancer: Destroying... [id=arn:aws:elasticloadbalancing:ap-south-1:773883478555:loadbalancer/app/ecs-load-balancer/ad5c298043ee36b8]
aws_route_table_association.test_public_sn_roAssn: Destruction complete after 1s
aws_route_table.test_public_sn_ro: Destroying... [id=rtb-0d6139ee4019dc255]
aws_route_table.test_public_sn_ro: Destruction complete after 0s
aws_internet_gateway.demoIG: Destroying... [id=igw-073c84886c5519f26]
aws_iam_role_policy_attachment.ecs-instance-role-attachment: Destruction complete after 3s
aws_iam_role_policy_attachment.ecs-service-role-attachment: Destruction complete after 3s
aws_iam_role.ecs-instance-role: Destroying... [id=ecs-instance-role]
aws_alb.ecs-load-balancer: Destruction complete after 3s
aws_iam_role.ecs-instance-role: Destruction complete after 2s
aws_ecs_service.test-ecs-service: Still destroying... [id=arn:aws:ecs:ap-south-1:773883478555:service/TestTim/test-ecs-service, 10s elapsed]
aws_autoscaling_group.ecs-autoscaling-group: Still destroying... [id=ecs-autoscaling-group, 10s elapsed]
aws_internet_gateway.demoIG: Still destroying... [id=igw-073c84886c5519f26, 10s elapsed]
aws_ecs_service.test-ecs-service: Still destroying... [id=arn:aws:ecs:ap-south-1:773883478555:service/TestTim/test-ecs-service, 20s elapsed]
aws_autoscaling_group.ecs-autoscaling-group: Still destroying... [id=ecs-autoscaling-group, 20s elapsed]
aws_internet_gateway.demoIG: Still destroying... [id=igw-073c84886c5519f26, 20s elapsed]
aws_ecs_service.test-ecs-service: Still destroying... [id=arn:aws:ecs:ap-south-1:773883478555:service/TestTim/test-ecs-service, 30s elapsed]
aws_autoscaling_group.ecs-autoscaling-group: Still destroying... [id=ecs-autoscaling-group, 30s elapsed]
aws_internet_gateway.demoIG: Still destroying... [id=igw-073c84886c5519f26, 30s elapsed]
aws_ecs_service.test-ecs-service: Still destroying... [id=arn:aws:ecs:ap-south-1:773883478555:service/TestTim/test-ecs-service, 40s elapsed]
aws_autoscaling_group.ecs-autoscaling-group: Still destroying... [id=ecs-autoscaling-group, 40s elapsed]
aws_internet_gateway.demoIG: Still destroying... [id=igw-073c84886c5519f26, 40s elapsed]
aws_ecs_service.test-ecs-service: Still destroying... [id=arn:aws:ecs:ap-south-1:773883478555:service/TestTim/test-ecs-service, 50s elapsed]
aws_autoscaling_group.ecs-autoscaling-group: Still destroying... [id=ecs-autoscaling-group, 50s elapsed]
aws_internet_gateway.demoIG: Still destroying... [id=igw-073c84886c5519f26, 50s elapsed]
aws_internet_gateway.demoIG: Destruction complete after 59s
aws_autoscaling_group.ecs-autoscaling-group: Still destroying... [id=ecs-autoscaling-group, 1m0s elapsed]
aws_ecs_service.test-ecs-service: Still destroying... [id=arn:aws:ecs:ap-south-1:773883478555:service/TestTim/test-ecs-service, 1m0s elapsed]
aws_ecs_service.test-ecs-service: Destruction complete after 1m4s
aws_iam_role.ecs-service-role: Destroying... [id=ecs-service-role]
aws_ecs_cluster.test-ecs-cluster: Destroying... [id=arn:aws:ecs:ap-south-1:773883478555:cluster/TestTim]
aws_alb_target_group.ecs-target-group: Destroying... [id=arn:aws:elasticloadbalancing:ap-south-1:773883478555:targetgroup/ecs-target-group/7752d2f05c38070d]
aws_ecs_task_definition.wordpress: Destroying... [id=hello_world]
aws_alb_target_group.ecs-target-group: Destruction complete after 0s
aws_ecs_task_definition.wordpress: Destruction complete after 0s
aws_ecs_cluster.test-ecs-cluster: Destruction complete after 0s
aws_iam_role.ecs-service-role: Destruction complete after 2s
aws_autoscaling_group.ecs-autoscaling-group: Still destroying... [id=ecs-autoscaling-group, 1m10s elapsed]
aws_autoscaling_group.ecs-autoscaling-group: Still destroying... [id=ecs-autoscaling-group, 1m20s elapsed]
aws_autoscaling_group.ecs-autoscaling-group: Still destroying... [id=ecs-autoscaling-group, 1m30s elapsed]
aws_autoscaling_group.ecs-autoscaling-group: Still destroying... [id=ecs-autoscaling-group, 1m40s elapsed]
aws_autoscaling_group.ecs-autoscaling-group: Destruction complete after 1m41s
aws_subnet.test_public_sn_02: Destroying... [id=subnet-0ec22fb6f340c091a]
aws_subnet.test_public_sn_01: Destroying... [id=subnet-09771ea26a2af6b78]
aws_launch_configuration.ecs-launch-configuration: Destroying... [id=ecs-launch-configuration]
aws_subnet.test_public_sn_02: Destruction complete after 1s
aws_subnet.test_public_sn_01: Destruction complete after 1s
aws_launch_configuration.ecs-launch-configuration: Destruction complete after 1s
aws_iam_instance_profile.ecs-instance-profile: Destroying... [id=ecs-instance-profile]
aws_security_group.test_public_sg: Destroying... [id=sg-0ea8f47dc41055781]
aws_security_group.test_public_sg: Destruction complete after 0s
aws_vpc.test_vpc: Destroying... [id=vpc-0695f8ad1f3eb18aa]
aws_vpc.test_vpc: Destruction complete after 0s
aws_iam_instance_profile.ecs-instance-profile: Destruction complete after 1s

Warning: Interpolation-only expressions are deprecated

  on application-load-balancer.tf line 4, in resource "aws_alb" "ecs-load-balancer":
   4:     security_groups     = ["${aws_security_group.test_public_sg.id}"]

Terraform 0.11 and earlier required all non-constant expressions to be
provided via interpolation syntax, but this pattern is now deprecated. To
silence this warning, remove the "${ sequence from the start and the }"
sequence from the end of this expression, leaving just the inner expression.

Template interpolation syntax is still used to construct strings from
expressions when the template includes multiple interpolation sequences or a
mixture of literal strings and interpolations. This deprecation applies only
to templates that consist entirely of a single interpolation sequence.

(and 35 more similar warnings elsewhere)


Destroy complete! Resources: 20 destroyed.
```
