kind=defined
names=unescape
visibility=public

--- unescape(string) -> string

string �� URL �ǥ����ɤ���ʸ����򿷤����������֤��ޤ���

        require "cgi"

        p CGI.unescape('%40%23%23')   #=> "@##"

        p CGI.unescape("http%3A%2F%2Fwww.example.com%2Findex.rss")
        #=> "http://www.example.com/index.rss"

