
resource "aws_alb" "ecs-load-balancer" {
    name                = "ecs-load-balancer"
    security_groups     = ["${aws_security_group.test_public_sg.id}"]
    subnets             = ["${aws_subnet.test_public_sn_01.id}", "${aws_subnet.test_public_sn_02.id}"]

    tags = {
      Name = "ecs-load-balancer"
    }
}

resource "aws_alb_target_group" "ecs-target-group" {
    name                = "ecs-target-group"
    port                = "80"
    protocol            = "HTTP"
    vpc_id              = "${aws_default_vpc.test_vpc.id}"

    health_check {
        healthy_threshold   = "5"
        unhealthy_threshold = "2"
        interval            = "30"
        matcher             = "200"
        path                = "/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = "5"
    }

    tags = {
      Name = "ecs-target-group"
    }
}

resource "aws_alb_listener" "alb-listener" {
    load_balancer_arn = "${aws_alb.ecs-load-balancer.arn}"
    port              = "80"
    protocol          = "HTTP"

    default_action {
        target_group_arn = "${aws_alb_target_group.ecs-target-group.arn}"
        type             = "forward"
    }
}


resource "aws_ecs_service" "test-ecs-service" {
    name            = "test-ecs-service"
    iam_role        = "${aws_iam_role.ecs-service-role.name}"
    cluster         = "${aws_ecs_cluster.test-ecs-cluster.id}"
    task_definition = "${aws_ecs_task_definition.wordpress.family}:${max("${aws_ecs_task_definition.wordpress.revision}", "${data.aws_ecs_task_definition.wordpress.revision}")}"
    desired_count   = 2

    load_balancer {
        target_group_arn  = "${aws_alb_target_group.ecs-target-group.arn}"
        container_port    = 80
        container_name    = "wordpress"
    }
}
