kind=defined
names=rfc1123_date
visibility=public

--- rfc1123_date(time) -> string

���� time �� [[RFC:1123]] �ե����ޥåȤ˽�򤷤�ʸ������Ѵ����ޤ���

�㡧
        require "cgi"

        CGI.rfc1123_date(Time.now)
          # => Sat, 1 Jan 2000 00:00:00 GMT

