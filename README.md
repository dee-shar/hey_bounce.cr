# hey_bounce.cr
Web-API for www.heybounce.io Fast, Accurate &amp; Secure Email Validation Service

## Example
```cr
require "./hey_bounce"

hey_bounce = HeyBounce.new(api_key="")
credits = hey_bounce.get_credits()
puts credits
```
