import re
from tinydb import TinyDB
from flask import Flask, request
import json
def getType(param):
    if re.match(r"^[+]?[7]{1}\d{10}$",param): return "phone"
    if re.match(r"^(0[1-9]|2[0-9]|3[0-1])[.](0[1-9]|1[1-2])[.]([1-2]\d{3})$",param): return "date"
    if re.match(r".+\@.+\..+",param): return "email"
    return "text"
def compare(d1,d2):
    #d1 - справочник из POST запроса
    #d2 - справочник из досумента tinyDB
    d2_length = len(d2)
    for i in d2:
        for k in d1:
            if (i == k) & (d2[i] == d1[k]):
                d2_length = d2_length - 1
                if d2_length == 1: return True
    return False
database = TinyDB('templates.json')
temp_dict = dict()
app = Flask(__name__)
@app.route('/', methods=['POST','GET'])
def hello():
    temp_dict={}
    if request.method == 'POST':
        post_data = request.form.to_dict()
        for x in post_data:
            post_data[x] = getType(post_data[x])
        print(post_data)
        for item in database:
            if compare(post_data,item):
                temp_dict[item['form_name']] = len(item)
    if len(temp_dict) == 0:
        return json.dumps(post_data)
    else:
        sv = sorted(temp_dict.values(),reverse=True)
        sd = {}
        for i in sv:
            for k in temp_dict.keys():
                if temp_dict[k] == i:
                    sd[k] = temp_dict[k]
        return json.dumps(list(sd)[0])

if __name__ == '__main__':
    app.run()

