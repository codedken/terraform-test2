// Create route53 for hosting your application with a custom domain name
resource "aws_route53_zone" "hosted_zone" {
  name = var.domain_name

  tags = {
    Environment = "Development"
  }
}

resource "aws_route53_record" "site_name" {
  name    = "terraform-test.${var.domain_name}"
  zone_id = aws_route53_zone.hosted_zone.zone_id
  type    = "A"

  alias {
    zone_id                = aws_lb.lb.zone_id
    name                   = aws_lb.lb.dns_name
    evaluate_target_health = true
  }
}
