resource "random_id" "create_token_efs" {
    byte_length = 8
    prefix = "${var.name}-"
}

resource "aws_efs_file_system" "project01-efs" {
    creation_token = random_id.create_token_efs.hex
    encrypted = var.encrypted
    #kms_key_id = var.kms_key
    tags = {
      "Name" = "project01-efs"
      "CreateBy" = "HOANGVIET"
    }
}

resource "aws_efs_mount_target" "project01-efs-mount01" {
    count = lenght(var.public-subnets)
    file_system_id = aws_efs_file_system.project01-efs.id
    subnet_id = element(var.public-subnets, count.index)
    security_groups = [ aws_security_group.efsmount-target.id ]
}
