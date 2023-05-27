data "aws_route53_zone" "zone" {
  name         = join(".",split(".",var.url)[-1])
}
resource "aws_route53_record" "cname" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = var.url #vault.something.com
  type    = "CNAME"
  ttl     = 300
  records = [var.ip] 
}