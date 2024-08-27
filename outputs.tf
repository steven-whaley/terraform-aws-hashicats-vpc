output "subnet_id" {
    value = aws_subnet.hashicat.id
}

output "security_group" {
    value = aws_security_group.hashicat.id
}