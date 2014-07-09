#! /usr/bin/env/python
# -*- coding: utf-8 -*-

from urllib2 import Request, urlopen, URLError
import json
import cgi

def main():
    redmine_url = "http://changeme"
    redmine_api_key = 'changeme'

    mustContinue = True
    offset = 0
    while mustContinue: 
        request = Request(redmine_api_key + '/users.json?offset='+str(offset))
        request.add_header('X-Redmine-API-Key', redmine_api_key)
        offset = offset + 1
        try:
            response = urlopen(request)
            _, params = cgi.parse_header(response.headers.get('Content-Type', ''))
            encoding = params.get('charset', 'utf-8')
            users = response.read().decode(encoding)
        
            content = json.loads(users, encoding='utf-8')
            
            if len(content['users']) == 0:
                mustContinue = False
                continue

            for user in content['users']:
                line = user['login'] + u' = ' + user['firstname'] + u' ' + user['lastname'] + u' <' + user['mail'] + u'>'
                print line.encode('utf8')
                # Meme ligne mais avec le login en majuscule
                line = user['login'].upper() + u' = ' + user['firstname'] + u' ' + user['lastname'] + u' <' + user['mail'] + u'>'
                print line.encode('utf8')
                line = user['login'].lower() + u' = ' + user['firstname'] + u' ' + user['lastname'] + u' <' + user['mail'] + u'>'
                print line.encode('utf8')
        except URLError, e:
            print 'Error: ', e


if __name__ == "__main__":
    main()
