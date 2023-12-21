-- proxy_request.lua
local http = require "resty.http"
local httpc = http.new()

-- local res, err = httpc:request_uri("http://abehiroshi.la.coocan.jp", {
--     method = ngx.req.get_method(),
--     headers = ngx.req.get_headers(),
--     body = ngx.req.get_body_data()
-- })

-- if not res then
--     ngx.log(ngx.ERR, "failed to send request: ", err)
--     ngx.exit(500)
-- end

-- ngx.status = res.status
-- ngx.say(res.body)
-- ngx.exit(ngx.status)
--
local redirect_rul = "https://google.com"
ngx.redirect(redirect_rul, ngx.HTTP_MOVED_PERMANENTLY)
