import wikipedia
#links = ["CPython"]
#test = [wikipedia.page(link, auto_suggest=False) for link in links]
#test = [testitem.content for testitem in test]
#print(test)

links = ["CPython","no page"]
test=[]
for link in links:
    try:
        #try to load the wikipedia page
        page=wikipedia.page(link, auto_suggest=False)
        test.append(page)
    except wikipedia.exceptions.PageError:
        #if a "PageError" was raised, ignore it and continue to next link
        continue
print(test)

for link in links:
        #try to load the wikipedia page
        page=wikipedia.page(link)
        test.append(page)

print(test)


links = ["CPython", "no page"]
test = []
for link in links:
    try:
        page = wikipedia.page(link, auto_suggest=False)
        test.append(page)
    except wikipedia.exceptions.PageError:
        pass
test = [testitem.content for testitem in test]
print(test)
