#!/usr/bin/python
# -*- coding: utf-8 -*-

## USAGE EXAMPLE: python check-message-translations.py cs

import sys
import os

from check_message_lib import find_language_file_name, get_js_keys, get_xml_keys

script_directory = os.path.dirname(os.path.realpath(__file__))
os.chdir(script_directory)

language1 = sys.argv[1]
language2 = sys.argv[2] if len(sys.argv) > 2 else 'en'

xml_file_name1 = find_language_file_name(language1, 'xml')
xml_file_name2 = find_language_file_name(language2, 'xml')

xml_keys1 = get_xml_keys(xml_file_name1)
xml_keys2 = get_xml_keys(xml_file_name2)

print('\nPresent in ' + xml_file_name2 + ' but missing in ' + xml_file_name1 + ':')
for key in sorted(xml_keys2 - xml_keys1):
    print(key)

print('\nPresent in ' + xml_file_name1 + ' but missing in ' + xml_file_name2 + ':')
for key in sorted(xml_keys1 - xml_keys2):
    print(key)

js_file_name1 = find_language_file_name(language1, 'js')
js_keys1 = get_js_keys(js_file_name1)
js_file_name2 = find_language_file_name(language2, 'js')
js_keys2 = get_js_keys(js_file_name2)

print('\nPresent in ' + js_file_name2 + ' but missing in ' + js_file_name1 + ':')
for key in (js_keys2 - js_keys1):
    print(key)

print('\nPresent in ' + js_file_name1 + ' but missing in ' + js_file_name2 + ':')
for key in (js_keys1 - js_keys2):
    print(key)

