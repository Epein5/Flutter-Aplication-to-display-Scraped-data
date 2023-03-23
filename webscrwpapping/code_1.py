from bs4 import BeautifulSoup
import requests
import matplotlib.pyplot as plt
from collections import Counter

vis=[]
url = 'https://realpython.github.io/fake-jobs/'
html = requests.get(url)
soup = BeautifulSoup(html.content, 'html.parser')

results = soup.find(class_='container mb-5')
heading = results.find_all('h1', class_='title is-1')


with open('flatfle.txt', 'w') as file:
    
    [file.write(i.text) for i in heading]
    file.write('\n')


    apply_links = soup.find_all('a', string='Apply')

    apply_urls = [link['href'] for link in apply_links]


    for  urlss in apply_urls:
        link_html = requests.get(urlss)
        link_soup = BeautifulSoup(link_html.content, 'html.parser')

        link_results = link_soup.find(id='ResultsContainer')

        jobTitle = link_results.find_all('h1', class_='title is-2')         
        # [print(i.text) for i in jobTitle]
        [file.write(i.text) for i in jobTitle]

        writers = link_results.find_all('h2', class_=' subtitle is-4 company')
        # [print(i.text) for i in writers]
        [file.write(i.text) for i in writers]
        file.write('\n')


        jobDescription = link_soup.find_all('p', class_= False, id=False)
        # [print(i.text) for i in jobDescription]
        [file.write(i.text) for i in jobDescription]
        file.write('\n')
        
        link_location = link_results.find_all('p', id="location")

        aa = link_soup.find('p',id="location").text.split(',')[1].strip()
        vis.append(aa)

        for i in link_location:
            i.strong.extract() 
            # print(i.text.strip())
            file.write(i.text.strip())
            file.write('\n')

        
        link_date = link_results.find_all('p', id="date")
        for i in link_date:
            i.strong.extract() 
            # print(i.text.strip())
            file.write(i.text.strip())
            file.write('\n')

        file.write('\n')
        file.write('\n')


counted_data = Counter(vis)
plt.pie(counted_data.values(), labels=counted_data.keys())
plt.title('Proportion of Categorical Data')
plt.show()