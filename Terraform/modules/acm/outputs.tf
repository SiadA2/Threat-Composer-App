output "certificate_arn"{
    description = "arn of the certificate"
    value = aws_acm_certificate.application.arn
}