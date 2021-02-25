resource "aws_security_group" "efsmount-target" {
    description = var.efs_sg_des
    vpc_id = var.vpc-id
    ingress {
        cidr_blocks = var.efs_cidr
        description = var.efs_port_des
        from_port = var.efs_port
        to_port = var.efs_port
        protocol = var.protocol
    }
}