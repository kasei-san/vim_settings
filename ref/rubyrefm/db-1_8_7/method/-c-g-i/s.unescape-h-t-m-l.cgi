kind=defined
names=unescapeHTML
visibility=public

--- unescapeHTML(string) -> string

string ��μ��λ��ȤΤ�����&amp; &gt; &lt; &quot;
�ȿ��ͻ��꤬����Ƥ����� (&#0ffff �ʤ�) �����򳰤��ޤ���

        require "cgi"

        p CGI.unescapeHTML("3 &gt; 1")   #=> "3 > 1"

